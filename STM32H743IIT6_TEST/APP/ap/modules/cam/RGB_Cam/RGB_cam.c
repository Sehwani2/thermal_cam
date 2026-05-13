#include "RGB_Cam/RGB_cam.h"
#include "lvgl/lvgl_ui.h"
#include "ov7670.h"
#include "cli.h"

extern osSemaphoreId_t RGBSemHandle;

static void onFrameCallback(void);
static void BilinearInterpolate_2x(const uint16_t *src_buffer, uint16_t *dst_buffer);
static float calc_roi_green_avg(const uint16_t *src);
volatile uint8_t rgb_frame_ready;



extern TIM_HandleTypeDef htim16;

arm_rfft_fast_instance_f32 fftHandler;
float fftBufferIn[FFT_BUFFER_SIZE];
float fftBufferOut[FFT_BUFFER_SIZE];
float magnitude[FFT_BUFFER_SIZE / 2];
// hann window
static float hann[FFT_BUFFER_SIZE];
static uint8_t hann_init = 0;

float sample_buffer[FFT_BUFFER_SIZE];
volatile uint16_t sample_idx = 0;
volatile uint8_t buffer_full = 0;

volatile float latest_green_avg = 0.0f;

volatile float bpm = 0.0f;
volatile uint8_t bpm_updated = 0;

#ifdef _USE_HW_CLI
static void cliRGBCAM(cli_args_t *args);
static volatile uint8_t cli_should_print_fft = 0;
#endif

bool RGBInit(void)
{
  ov7670_config(OV7670_MODE_QVGA_RGB565);
  ov7670_registerCallback(NULL, NULL, &onFrameCallback);

#ifdef _USE_HW_CLI
  cliAdd("RGBCam", cliRGBCAM);
#endif
  logPrintf("[  ] RGBThread()\n");
  return true;
}

static void onFrameCallback(void)
{
  rgb_frame_ready=1;
}


void RGBThread(void *argument)
{
  RGBInit();

  while(1)
  {
    if(rgb_frame_ready == 1)
    {
      rgb_frame_ready = 0;
      const uint16_t *src = CamGetFrameBuffer();

      if(current_screen == SCREEN_RGB)
      {
        BilinearInterpolate_2x(src,CanvasGetFrameBuffer());
        osSemaphoreRelease(RGBSemHandle);
      }
      if(bpm_state == BPM_RUNNING)
      {
        // extract green chaneel
        float new_green_avg = calc_roi_green_avg(src);

        //taskENTER_CRITICAL();
        latest_green_avg = new_green_avg;
        //taskEXIT_CRITICAL();
      }
    }
    delay(20);
  }
}

void BPMThread(void *argument)
{
  HAL_TIM_Base_Start_IT(&htim16);
  arm_rfft_fast_init_f32(&fftHandler, FFT_BUFFER_SIZE);  // 초기화

  if (!hann_init)
  {
    for (int i = 0; i < FFT_BUFFER_SIZE; i++)
    {
      hann[i] = 0.5f * (1.0f - cosf(2.0f * PI * i / (FFT_BUFFER_SIZE - 1)));
    }
    hann_init = 1;
  }

  while(1)
  {
    if (!buffer_full)
    {
      delay(30);
      continue;
    }

    taskENTER_CRITICAL();
    memcpy(fftBufferIn, sample_buffer, sizeof(float) * FFT_BUFFER_SIZE);
    buffer_full = 0;
    sample_idx = 0;
    taskEXIT_CRITICAL();

    // ============================================
    // DC 제거
    // ============================================
    float mean = 0.0f;
    for (int i = 0; i < FFT_BUFFER_SIZE; i++)
    {
      mean += fftBufferIn[i];
    }
    mean /= FFT_BUFFER_SIZE;

    for (int i = 0; i < FFT_BUFFER_SIZE; i++)
    {
      fftBufferIn[i] -= mean;
    }

    // ============================================
    // Hann window
    // ============================================
    for (int i = 0; i < FFT_BUFFER_SIZE; i++)
    {
      fftBufferIn[i] *= hann[i];
    }

    // FFT 실행
    arm_rfft_fast_f32(&fftHandler, fftBufferIn, fftBufferOut, 0);
    arm_cmplx_mag_f32(fftBufferOut, magnitude, FFT_BUFFER_SIZE / 2);

#ifdef _USE_HW_CLI
    cli_should_print_fft = 1;
#endif


    float Fs = 15.36;
    int N = FFT_BUFFER_SIZE;

    int bin_start = (int)(0.8f * N / Fs);   // 48 BPM
    int bin_end   = (int)(3.0f * N / Fs);   // 180 BPM

    float max_val = 0.0f;
    int max_bin = bin_start;

    for(int i = bin_start; i <= bin_end; i++)
    {
        if(magnitude[i] > max_val)
        {
            max_val = magnitude[i];
            max_bin = i;
        }
    }

    float freq_hz = (float)max_bin * Fs / N;
    bpm = freq_hz * 60.0f;
    bpm_updated = 1;

//    float bin_res = 15.36f / FFT_BUFFER_SIZE; // 15.36hz
//
//    float low_freq  = 0.8f;
//    float high_freq = 2.5f;
//
//    int start_bin = (int)(low_freq / bin_res);
//    int end_bin   = (int)(high_freq / bin_res);

      //    float max_mag = 0.0f;          //
      //    int peak_idx = start_bin;      //
      //
      //    for (int i = start_bin; i <= end_bin; i++)
      //    {
      //      if (magnitude[i] > max_mag)
      //      {
      //        max_mag = magnitude[i];
      //        peak_idx = i;
      //      }
      //    }
      //
      //    bpm = peak_idx * bin_res * 60.0f;
      //    bpm_updated = 1;

  }
}


void TimerCallback(TIM_HandleTypeDef *htim)
{
  if (htim->Instance == TIM16) // 15.36hz
  {
    if(bpm_state == BPM_RUNNING)
    {
      //fill buffer
      if (sample_idx < FFT_BUFFER_SIZE)
      {
        sample_buffer[sample_idx] = latest_green_avg;
        sample_idx++;

        // when buffer full, flag on
        if (sample_idx >= FFT_BUFFER_SIZE)
        {
          buffer_full = 1;
        }
      }
    }
  }
}

static float calc_roi_green_avg(const uint16_t *src)
{
  uint32_t sum = 0;
  uint32_t cnt = 0;

  for (int y = ROI_Y; y < ROI_Y + ROI_H; y++)
  {
    for (int x = ROI_X; x < ROI_X + ROI_W; x++)
    {
      uint16_t p = src[y * OV7670_QVGA_WIDTH + x];
      sum += (p >> 5) & 0x3F;
      cnt++;
    }
  }

  return (float)sum / (float)cnt;
}


static void BilinearInterpolate_2x(const uint16_t *src_buffer, uint16_t *dst_buffer)
{

  uint16_t *src = (uint16_t*)src_buffer;
  uint16_t *dst = (uint16_t*)dst_buffer;

  for (int y = 0; y < 240; y++)
  {
    int sy = y >> 1;
    int fy = (y & 1) << 8;

    int src_y0 = sy * 160;
    int src_y1 = (sy + 1 < 120) ? (sy + 1) * 160 : src_y0;

    for (int x = 0; x < 320; x++)
    {
      int sx = x >> 1;
      int fx = (x & 1) << 8;

      uint16_t p00 = src[src_y0 + sx];
      uint16_t p01 = (sx + 1 < 160) ? src[src_y0 + sx + 1] : p00;
      uint16_t p10 = src[src_y1 + sx];
      uint16_t p11 = (sx + 1 < 160) ? src[src_y1 + sx + 1] : p10;

      uint32_t r00 = (p00 >> 11) & 0x1F;  uint32_t g00 = (p00 >> 5) & 0x3F;  uint32_t b00 = p00 & 0x1F;
      uint32_t r01 = (p01 >> 11) & 0x1F;  uint32_t g01 = (p01 >> 5) & 0x3F;  uint32_t b01 = p01 & 0x1F;
      uint32_t r10 = (p10 >> 11) & 0x1F;  uint32_t g10 = (p10 >> 5) & 0x3F;  uint32_t b10 = p10 & 0x1F;
      uint32_t r11 = (p11 >> 11) & 0x1F;  uint32_t g11 = (p11 >> 5) & 0x3F;  uint32_t b11 = p11 & 0x1F;

      uint32_t r0 = r00 + (((r01 - r00) * fx) >> 8);
      uint32_t g0 = g00 + (((g01 - g00) * fx) >> 8);
      uint32_t b0 = b00 + (((b01 - b00) * fx) >> 8);

      uint32_t r1 = r10 + (((r11 - r10) * fx) >> 8);
      uint32_t g1 = g10 + (((g11 - g10) * fx) >> 8);
      uint32_t b1 = b10 + (((b11 - b10) * fx) >> 8);

      uint32_t r = r0 + (((r1 - r0) * fy) >> 8);
      uint32_t g = g0 + (((g1 - g0) * fy) >> 8);
      uint32_t b = b0 + (((b1 - b0) * fy) >> 8);

      dst[y * 320 + x] = (r << 11) | (g << 5) | b;
    }
  }
}



static void cliRGBCAM(cli_args_t *args)
{
  bool ret = false;

  if (args->argc == 1 && args->isStr(0, "show"))
  {
    cliPrintf("RGBCAM show 시작 (sample_idx & FFT 결과 모니터링)\n");
    cliPrintf("ESC나 q로 종료\n\n");

    while (cliKeepLoop())
    {
      cliPrintf("sample_idx = %3d / %d   ", sample_idx, FFT_BUFFER_SIZE);


      if (cli_should_print_fft)
      {
        int count = 0;
        cliPrintf("\n┌──────────── FFT Complex ────────────┐\n");
        cliPrintf("bin |   Re      Im\n");

        for (int k = 1; k < FFT_BUFFER_SIZE/2; k++)
        {
          float re = fftBufferOut[2*k];
          float im = fftBufferOut[2*k + 1];

          cliPrintf("%3d | %8.3f %8.3f\n", k, re, im);
        }
        if (count % 5 != 0) cliPrintf("\n");

        count = 0;
        cliPrintf("\n┌──────────── FFT Magnitude ────────────┐\n");

        for (int i = 0; i < FFT_BUFFER_SIZE/2; i++)
        {
          cliPrintf("%3d: %8.3f  ", i, magnitude[i]);
          count++;
          if (count % 5 == 0) cliPrintf("\n");
        }
        if (count % 5 != 0) cliPrintf("\n");

        cliPrintf("└───────────────────────────────────────────────────────────────────────┘\n");

        cli_should_print_fft = 0;           // 출력 완료
      }
      else
      {
        cliPrintf("  (FFT 결과 대기중...)\r");  // 같은 줄 갱신
      }

      delay(300);
    }

    cliPrintf("\nRGBCAM show 종료\n");
    ret = true;
  }

  if (!ret)
  {
    cliPrintf("RGBCAM show     - 실시간 sample_idx & magnitude 모니터링\n");
  }
}


