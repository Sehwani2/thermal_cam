#include "thermal_Cam/thermal_cam.h"
#include "lvgl/lvgl_ui.h"
#include "MLX90640.h"
#include "cli.h"

extern osSemaphoreId_t thermalSemHandle;

static float get_face_avg_temp(void);



arm_rfft_fast_instance_f32 fftHandler2;
float fftBufferIn2[MLX_FFT_BUFFER_SIZE];
float fftBufferOut2[MLX_FFT_BUFFER_SIZE];
float magnitude2[MLX_FFT_BUFFER_SIZE / 2];

volatile float mlx_bpm = 0.0f;
volatile float latest_avg_temp = 0.0f;
volatile uint8_t mlx_bpm_updated =0;
volatile uint16_t bpm_idx = 0;
extern uint8_t pause_flag;

static float hann[MLX_FFT_BUFFER_SIZE];
static uint8_t hann_init = 0;

#ifdef _USE_HW_CLI
static void cliMLXCAM(cli_args_t *args);
static volatile uint8_t cli_should_print_fft2 = 0;
#endif

bool thermalInit(void)
{
  mlx90640.min_temp = 0.0;
  mlx90640.max_temp = 40.0;

#ifdef _USE_HW_CLI
  cliAdd("MLXCam", cliMLXCAM);
#endif

  return true;
}

void thermalThread(void *argument)
{
  thermalInit();

  logPrintf("[  ] thermalThread()\n");

  while(1)
  {
    if(current_screen == SCREEN_THERMAL)
    {
      if (pause_flag) { delay(5); continue;}

      int status = MLX90640_ReadFrame();
      if(status < 0) {delay(5); continue;};

      BilinearInterpolate_MLX90640(mlx90640.to, canvas_buffer, UPSCALE_SCALE, true);
      osSemaphoreRelease(thermalSemHandle);

      if (mlx_bpm_state == BPM_RUNNING)
      {
        taskENTER_CRITICAL();
        latest_avg_temp = get_face_avg_temp();
        taskEXIT_CRITICAL();
      }

    }
    delay(10);
  }
}


void BPMThread2(void *argument)
{
  TickType_t lastWake = xTaskGetTickCount();
  const TickType_t period = pdMS_TO_TICKS(62); // ≈16.13 Hz

  const float Fs = 1000.0f / 62.0f;
  const float bin_res = Fs / (float)MLX_FFT_BUFFER_SIZE;

  arm_rfft_fast_init_f32(&fftHandler2, MLX_FFT_BUFFER_SIZE);

  /* ---------------- Hann window init ---------------- */
  if (!hann_init)
  {
    for (int i = 0; i < MLX_FFT_BUFFER_SIZE; i++)
    {
      hann[i] = 0.5f * (1.0f - cosf(2.0f * PI * i / (MLX_FFT_BUFFER_SIZE - 1)));
    }
    hann_init = 1;
  }

  while (1)
  {
    vTaskDelayUntil(&lastWake, period);

    if (mlx_bpm_state != BPM_RUNNING)
      continue;

    float sample = latest_avg_temp;
    if (sample <= 0.0f)
      continue;

    fftBufferIn2[bpm_idx++] = sample;

    if (bpm_idx < MLX_FFT_BUFFER_SIZE)
      continue;

    /* ================= FFT PROCESS ================= */
    bpm_idx = 0;

    /* ------------------------------------------------
     * 1. DC 제거
     * ------------------------------------------------ */
    float mean = 0.0f;
    for (int i = 0; i < MLX_FFT_BUFFER_SIZE; i++)
      mean += fftBufferIn2[i];
    mean /= (float)MLX_FFT_BUFFER_SIZE;

    for (int i = 0; i < MLX_FFT_BUFFER_SIZE; i++)
      fftBufferIn2[i] -= mean;

    /* ------------------------------------------------
     * 2.High-pass filter
     * ------------------------------------------------ */
    const float hpf_alpha = 0.925f;
    float y_prev = 0.0f;
    float x_prev = fftBufferIn2[0];

    for (int i = 0; i < MLX_FFT_BUFFER_SIZE; i++)
    {
      float x = fftBufferIn2[i];
      float y = hpf_alpha * (y_prev + x - x_prev);

      fftBufferIn2[i] = y;

      y_prev = y;
      x_prev = x;
    }

    /* ------------------------------------------------
     * 3. Hann window
     * ------------------------------------------------ */
    for (int i = 0; i < MLX_FFT_BUFFER_SIZE; i++)
      fftBufferIn2[i] *= hann[i];

    /* ------------------------------------------------
     * 4. FFT
     * ------------------------------------------------ */
    arm_rfft_fast_f32(&fftHandler2,
                      fftBufferIn2,
                      fftBufferOut2,
                      0);

    arm_cmplx_mag_f32(fftBufferOut2,
                      magnitude2,
                      MLX_FFT_BUFFER_SIZE / 2);

#ifdef _USE_HW_CLI
    cli_should_print_fft2 = 1;
#endif

    /* ------------------------------------------------
     * 5. BPM 대역 peak 탐색
     * ------------------------------------------------ */
    const float BPM_MIN_HZ = 1.0f;   // 54 BPM
    const float BPM_MAX_HZ = 2.5f;   // 150 BPM

    int start_bin = (int)(BPM_MIN_HZ / bin_res);
    int end_bin   = (int)(BPM_MAX_HZ / bin_res);

    if (end_bin >= MLX_FFT_BUFFER_SIZE / 2)
      end_bin = (MLX_FFT_BUFFER_SIZE / 2) - 1;

    float max_mag = 0.0f;
    int peak_bin = -1;

    for (int i = start_bin; i <= end_bin; i++)
    {
      if (magnitude2[i] > max_mag)
      {
        max_mag = magnitude2[i];
        peak_bin = i;
      }
    }

    /* ------------------------------------------------
     * 6. Peak centroid 보정
     * ------------------------------------------------ */
    float band_energy = 0.0f;
    for (int i = start_bin; i <= end_bin; i++)
      band_energy += magnitude2[i];

    if (peak_bin > 0 && max_mag > 0.25f * band_energy)
    {
      const int win = 3;
      int l = peak_bin - win;
      int r = peak_bin + win;

      if (l < start_bin) l = start_bin;
      if (r > end_bin)   r = end_bin;

      float num = 0.0f;
      float den = 0.0f;

      for (int i = l; i <= r; i++)
      {
        num += magnitude2[i] * (float)i;
        den += magnitude2[i];
      }

      float peak_bin_f = (den > 0.0f) ? (num / den) : (float)peak_bin;

      mlx_bpm = peak_bin_f * bin_res * 60.0f;
      mlx_bpm_updated = 1;
    }
    else
    {
      mlx_bpm_updated = 0;
    }
  }
}


static float get_face_avg_temp(void)
{
  // roi 풀링을 하기엔 애매해서 사람의 피부 온도 기준으로 추출 평균
  float sum = 0.0f;
  int count = 0;

  // min/max 범위 설정 (피부 온도) ─────
  const float SKIN_TEMP_MIN = 30.0f;
  const float SKIN_TEMP_MAX = 40.0f;

  for (int i = 0; i < 768; i++)
  {
    float temp = mlx90640.to[i];

    if (temp >= SKIN_TEMP_MIN && temp <= SKIN_TEMP_MAX)
    {
      sum += temp;
      count++;
    }
  }

  // ───── 최소 픽셀 수 안 되면 얼굴 아님 → 0 리턴 ─────
  if (count < 768/10)
  {
    return 0.0f;
  }

  return sum / count;
}


static void cliMLXCAM(cli_args_t *args)
{
  bool ret = false;

  if (args->argc == 1 && args->isStr(0, "show"))
  {
    cliPrintf("MLXCAM show 시작 (idx & FFT 결과 모니터링)\n");
    cliPrintf("ESC나 q로 종료\n\n");

    while (cliKeepLoop())
    {
      cliPrintf("bpm_idx = %3d / %d   ", bpm_idx, MLX_FFT_BUFFER_SIZE);


      if (cli_should_print_fft2)
      {
        int count = 0;
        cliPrintf("\n┌──────────── FFT Magnitude ────────────┐\n");

        for (int i = 0; i < MLX_FFT_BUFFER_SIZE/2; i++)
        {
          cliPrintf("%3d: %8.3f  ", i, magnitude2[i]);
          count++;
          if (count % 5 == 0) cliPrintf("\n");
        }
        if (count % 5 != 0) cliPrintf("\n");

        cliPrintf("└───────────────────────────────────────────────────────────────────────┘\n");

        cli_should_print_fft2 = 0;           // 출력 완료
      }
      else
      {
        cliPrintf("  (FFT 결과 대기중...)\r");  // 같은 줄 갱신
      }

      delay(300);
    }

    cliPrintf("\nMLXCAM show 종료\n");
    ret = true;
  }

  if (!ret)
  {
    cliPrintf("MLXCAM show     - 실시간 idx & magnitude 모니터링\n");
  }
}
