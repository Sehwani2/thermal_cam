#include "lvgl/lvgl_ui.h"
#include "thermal_Cam/thermal_cam.h"
#include "RGB_Cam/RGB_cam.h"
#include "ov7670.h"
#include "lcd/thermal_palette_common.h"

#define MARKER_SIZE 40

static lv_style_t style_radio;
static lv_style_t style_radio_chk;
static uint32_t active_range_index = 0;

static void lvgl_launcher(void);
static void button_event_cb(lv_event_t * e);
static void screen_thermal_show();
static void screen_RGBcamera_show();
static void back_to_main_cb(lv_event_t * e);
static void setting_page_cb(lv_event_t * e);
static void Palette_event_handler(lv_event_t * e);
static void min_range_event_handler(lv_event_t * e);
static void max_range_event_handler(lv_event_t * e);
static void radiobutton_create(lv_obj_t * parent, const char * txt);
static void range_radio_event_cb(lv_event_t * e);
static void pause_cb(lv_event_t * e);
static void back_to_heapMap_cb(lv_event_t * e);
static void thermal_touch_cb(lv_event_t * e);
static void marker_cb(lv_event_t * e);
static void BPM_page_cb(lv_event_t * e);
static void BPM_start_cb(lv_event_t * e);
static void MLX_BPM_page_cb(lv_event_t * e);
static void MLX_BPM_start_cb(lv_event_t * e);
static lv_obj_t * create_bpm_bar(lv_obj_t *parent);

static lv_obj_t * create_right_btn_container(lv_obj_t *parent);
static lv_obj_t * create_square_btn(lv_obj_t *parent,lv_coord_t size,
                                    const char *text, lv_event_cb_t cb);
static lv_obj_t * create_color_bar(lv_obj_t *parent);
static lv_obj_t * create_touch_marker(lv_obj_t *parent);

uint16_t canvas_buffer[CANVAS_W * CANVAS_H]__attribute__((section(".canvas_buffer"), aligned(64)));


volatile ScreenState_t current_screen = SCREEN_MAIN;
volatile bpm_state_t bpm_state = BPM_INACTIVE;
volatile bpm_state_t mlx_bpm_state = BPM_INACTIVE;

lv_obj_t *rgb_canvas;
lv_obj_t *thermal_canvas;
lv_obj_t *color_bar_canvas;
lv_obj_t * chart;
lv_chart_series_t * ser_bpm;
lv_obj_t * bpm_label;
lv_obj_t * rgb_bpm_label;
lv_obj_t * mlx_bpm_label;
lv_obj_t *label_min;
lv_obj_t *label_max;
lv_obj_t *label_temp;
static lv_obj_t *touch_marker = NULL;
static lv_obj_t *BPM_ROI_Box = NULL;
uint8_t pause_flag =0;

lv_obj_t *btn_container;

lv_obj_t *mlx_btn_BPM_start;
lv_obj_t *mlx_btn_BPM;
lv_obj_t *marker_box;
lv_obj_t *pause_box;
lv_obj_t *btn_settings;
lv_obj_t *mlx_bpm_bar;

lv_obj_t *btn_BPM_start;
lv_obj_t *btn_BPM;
lv_obj_t *btn_back;
lv_obj_t *bpm_bar;
// touch tmep 변수
static float   touched_temperature = 0.0f;
static int     touched_orig_x      = -1;   // -1 = 터치된 적 없음
static int     touched_orig_y      = -1;
static uint8_t touch_flag = 0;
uint32_t mlx_index;

extern osSemaphoreId_t thermalSemHandle;
extern osSemaphoreId_t RGBSemHandle;

extern float global_min_temp;
extern float global_max_temp;
extern uint8_t minmax_update_flag;

bool lvglThreadInit(void)
{
  lvglInit();
  return true;
}


void lvglThread(void *argument)
{
  lvglInit();
  lvgl_launcher();

  uint32_t last_cam_redraw = 0;
  uint32_t last_bar_update = 0;
  uint32_t last_label_update = 0;

  while(1)
  {
    uint32_t now = lv_tick_get();

    if (current_screen == SCREEN_THERMAL)
    {
      if (osSemaphoreAcquire(thermalSemHandle, 0) == osOK)
      {
        if (now - last_cam_redraw > 33)
        {
          lv_obj_invalidate(thermal_canvas);
          last_cam_redraw = now;
        }
      }

      if(mlx_bpm_state == BPM_RUNNING)
      {
        if (now - last_bar_update > 40)
        {
          lv_bar_set_value(mlx_bpm_bar, bpm_idx, LV_ANIM_OFF);
          last_bar_update = now;
        }

        if(mlx_bpm_updated)
        {
          mlx_bpm_updated = 0;

          char buf[16];
          int bpm_int = (int)(mlx_bpm);
          lv_snprintf(buf, sizeof(buf), "BPM : %d", bpm_int);

          lv_label_set_text(mlx_bpm_label, buf);

        }
      }

      if (mlx90640.auto_temp == 0 && minmax_update_flag == 1)
      {
        minmax_update_flag = 0;
        mlx90640.min_temp = global_min_temp;
        mlx90640.max_temp = global_max_temp;
        update_min_temp_labels();
        update_max_temp_labels();
      }

      if(touch_flag == 1)
      {
        touched_temperature = mlx90640.to[mlx_index];
        char buf_touch[64];
        int touch_int = (int)touched_temperature;
        int touch_dec = (int)((touched_temperature - touch_int) * 10);
        lv_snprintf(buf_touch, sizeof(buf_touch), "Touch Point: %d.%d°C", touch_int, touch_dec);
        lv_label_set_text(label_temp, buf_touch);
      }


    }
    else if(current_screen == SCREEN_RGB)
    {
      if (osSemaphoreAcquire(RGBSemHandle, 0) == osOK)
      {
        if (now - last_cam_redraw > 33)
        {
          lv_obj_invalidate(rgb_canvas);
          last_cam_redraw = now;
        }
      }
      if(bpm_state == BPM_RUNNING)
      {
        if (now - last_bar_update > 50)
        {
          lv_bar_set_value(bpm_bar, sample_idx, LV_ANIM_OFF);
          last_bar_update = now;
        }

        if(bpm_updated)
        {
        bpm_updated = 0;

        char buf[16];
        int bpm_int = (int)(bpm);
        lv_snprintf(buf, sizeof(buf), "BPM : %d", bpm_int);

        lv_label_set_text(rgb_bpm_label, buf);

        }
      }
    }

    lvglUpdate();
    delay(4);
  }
}

//////////////////////////////////////////////

static void lvgl_launcher(void)
{
  const char *btn_names[] = {"RGB", "THERMAL"};

  lv_obj_t * main_screen = lv_obj_create(lv_screen_active());
  lv_obj_set_size(main_screen, 480, 320);
  lv_obj_align(main_screen, LV_ALIGN_CENTER, 0, 0);

  lv_obj_set_flex_flow(main_screen, LV_FLEX_FLOW_ROW);
  lv_obj_set_flex_align(main_screen, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);
  lv_obj_set_style_pad_column(main_screen, 20, 0); // 버튼 간 간격

  for(int i = 0; i < 2; i++) {
    lv_obj_t * btn = lv_button_create(main_screen);
    lv_obj_set_size(btn, 100, 80);

    lv_obj_t * label = lv_label_create(btn);
    lv_label_set_text(label, btn_names[i]);
    lv_obj_center(label);

    // 버튼마다 이벤트 등록, user_bpm_data로 i 전달
    lv_obj_add_event_cb(btn, button_event_cb, LV_EVENT_CLICKED, (void*)i);

  }
}


static void button_event_cb(lv_event_t * e)
{
  lv_obj_t * btn = lv_event_get_target(e);
  int id = (int)lv_event_get_user_data(e);

  switch(id) {
  case 0:
    current_screen = SCREEN_RGB;
    ov7670_startCap(OV7670_CAP_CONTINUOUS, (uint32_t)CamGetFrameBuffer());
    screen_RGBcamera_show();
    break;
  case 1:
    current_screen = SCREEN_THERMAL;
    screen_thermal_show();
    break;
  }
}
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
static void screen_RGBcamera_show()
{
  lv_obj_t *scr = lv_obj_create(NULL);
  rgb_canvas = lv_canvas_create(scr);
  lv_canvas_set_buffer(rgb_canvas, (lv_color_t*)CanvasGetFrameBuffer(), CANVAS_W, CANVAS_H , LV_COLOR_FORMAT_RGB565);
  lv_obj_center(rgb_canvas);

  // BPM ROI BOX
  BPM_ROI_Box = lv_obj_create(rgb_canvas);
  lv_obj_set_size(BPM_ROI_Box, ROI_W*2, ROI_H*2);
  lv_obj_set_pos (BPM_ROI_Box, (CANVAS_W -ROI_W*2)/2, (CANVAS_H- ROI_H*2)/2);
  lv_obj_set_style_bg_opa(BPM_ROI_Box, LV_OPA_TRANSP, 0);
  lv_obj_set_style_border_color(BPM_ROI_Box, lv_color_white(), 0);
  lv_obj_set_style_border_width(BPM_ROI_Box, 2, 0);
  lv_obj_set_style_radius(BPM_ROI_Box, 0, 0);
  lv_obj_add_flag(BPM_ROI_Box, LV_OBJ_FLAG_HIDDEN);

  // BPM 라벨
  rgb_bpm_label = lv_label_create(scr);
  lv_label_set_text(rgb_bpm_label, "Place your face in t he white box");
  lv_obj_align(rgb_bpm_label, LV_ALIGN_TOP_MID, 0, 10);
  lv_obj_add_flag(rgb_bpm_label, LV_OBJ_FLAG_HIDDEN);

  // BPM 측정 진행 게이지
  bpm_bar = create_bpm_bar(scr);

  // 오른쪽 세로 버튼 컨테이너
  lv_obj_t *btn_container = create_right_btn_container(scr);
  lv_obj_clear_flag(btn_container, LV_OBJ_FLAG_SCROLLABLE);
  // 뒤로가기 버튼
  btn_back =  create_square_btn(btn_container,50,LV_SYMBOL_NEW_LINE,back_to_main_cb);
  btn_BPM =   create_square_btn(btn_container,50,"BPM",BPM_page_cb);
  btn_BPM_start =   create_square_btn(btn_container,50,LV_SYMBOL_PLAY,BPM_start_cb);
  lv_obj_add_flag(btn_BPM_start, LV_OBJ_FLAG_HIDDEN);

  lv_scr_load(scr);
}


static void BPM_page_cb(lv_event_t * e)
{
  static bool roi_visible = false;

  roi_visible = !roi_visible;

  if (roi_visible)
  {
    bpm_state = BPM_READY;
    lv_obj_clear_flag(BPM_ROI_Box, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(rgb_bpm_label, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(btn_BPM_start, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(bpm_bar      , LV_OBJ_FLAG_HIDDEN);
  }
  else
  {
    bpm_state = BPM_INACTIVE;
    lv_obj_add_flag(BPM_ROI_Box, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(rgb_bpm_label, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(btn_BPM_start, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(bpm_bar, LV_OBJ_FLAG_HIDDEN);
  }
}
static void BPM_start_cb(lv_event_t * e)
{
  static bool start_flag = false;

  lv_obj_t *btn_BPM_start_label = lv_obj_get_child(btn_BPM_start, 0);

  start_flag = !start_flag;

  if (start_flag)
  {
    bpm_state = BPM_RUNNING;
    lv_label_set_text(btn_BPM_start_label, LV_SYMBOL_PAUSE );
    lv_label_set_text(rgb_bpm_label, "BPM: --");
  }
  else
  {
    bpm_state = BPM_PAUSED;
    lv_label_set_text(btn_BPM_start_label, LV_SYMBOL_PLAY);
    lv_label_set_text(rgb_bpm_label, "");
  }
}


////////////////////////////////////////////////////////////////////////////////////////
static void screen_thermal_show()
{
  lv_obj_t *scr = lv_obj_create(NULL);

  /* ---------------------------
   * 카메라(열화상)
   * --------------------------- */
  thermal_canvas = lv_canvas_create(scr);
  lv_canvas_set_buffer(thermal_canvas, (lv_color_t*)CanvasGetFrameBuffer(), CANVAS_W, CANVAS_H , LV_COLOR_FORMAT_RGB565);
  lv_obj_center(thermal_canvas);
  lv_obj_set_style_border_width(thermal_canvas, 1, 0);      // 테두리 두께
  lv_obj_set_style_border_color(thermal_canvas, lv_color_white(), 0);  // 테두리 색
  lv_obj_set_style_border_opa(thermal_canvas, LV_OPA_COVER, 0);        // 테두리 불투명
  lv_obj_add_flag(thermal_canvas, LV_OBJ_FLAG_CLICKABLE);

  // touch event to get touched coordinate temp
  lv_obj_add_event_cb(thermal_canvas, thermal_touch_cb, LV_EVENT_PRESSING, NULL);

  // touch marker
  touch_marker = create_touch_marker(scr);

  //  컬러바
  palette_generate();
  color_bar_canvas = create_color_bar(scr);

  // 최저 온도 라벨 (아래쪽)
  label_min = lv_label_create(scr);
  lv_label_set_text(label_min, "--.-°C");
  update_min_temp_labels();
  lv_obj_align_to(label_min, color_bar_canvas, LV_ALIGN_OUT_BOTTOM_MID, 0, 8);
  // 최고 온도 라벨 (위쪽)
  label_max = lv_label_create(scr);
  lv_label_set_text(label_max, "--.-°C");
  update_max_temp_labels();
  lv_obj_align_to(label_max, color_bar_canvas, LV_ALIGN_OUT_TOP_MID, 0, -8);

  // 좌표 온도 라벨
  label_temp = lv_label_create(scr);
  lv_label_set_text(label_temp, "Touch Point: --.-°C");
  lv_obj_align(label_temp, LV_ALIGN_BOTTOM_MID, 0, -10);

  // BPM 라벨
  mlx_bpm_label = lv_label_create(scr);
  lv_label_set_text(mlx_bpm_label, "Keep your index finger in view");
  lv_obj_align(mlx_bpm_label, LV_ALIGN_TOP_MID, 0, 10);
  lv_obj_add_flag(mlx_bpm_label, LV_OBJ_FLAG_HIDDEN);

  mlx_bpm_bar = create_bpm_bar(scr);
  lv_bar_set_range(mlx_bpm_bar, 0, MLX_FFT_BUFFER_SIZE);
  btn_container = create_right_btn_container(scr);

  lv_obj_t *btn_back =     create_square_btn(btn_container,50,LV_SYMBOL_NEW_LINE,back_to_main_cb); // 뒤로가기 버튼
  btn_settings = create_square_btn(btn_container,50,LV_SYMBOL_SETTINGS,setting_page_cb); // 설정 버튼
  pause_box =    create_square_btn(btn_container,50,LV_SYMBOL_PAUSE, pause_cb); // PAUSE 버튼
  marker_box =   create_square_btn(btn_container,50,"Marker",marker_cb); // marker off 버튼
  mlx_btn_BPM =   create_square_btn(btn_container,50,"BPM",MLX_BPM_page_cb);
  mlx_btn_BPM_start =   create_square_btn(btn_container,50,LV_SYMBOL_PLAY,MLX_BPM_start_cb);
  lv_obj_add_flag(mlx_btn_BPM_start, LV_OBJ_FLAG_HIDDEN);

  lv_scr_load(scr);
}

static void MLX_BPM_page_cb(lv_event_t * e)
{
  static bool visible = false;

  visible = !visible;

  if (visible)
  {
    mlx_bpm_state = BPM_READY;

    lv_obj_add_flag(color_bar_canvas, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(label_min, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(label_max, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(label_temp, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(pause_box, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(marker_box, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(btn_settings, LV_OBJ_FLAG_HIDDEN);

    lv_obj_clear_flag(mlx_bpm_label, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(mlx_bpm_bar, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(mlx_btn_BPM_start      , LV_OBJ_FLAG_HIDDEN);
  }
  else
  {
    mlx_bpm_state = BPM_INACTIVE;

    lv_obj_clear_flag(color_bar_canvas, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(label_min, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(label_max, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(label_temp, LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(pause_box      , LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(marker_box      , LV_OBJ_FLAG_HIDDEN);
    lv_obj_clear_flag(btn_settings      , LV_OBJ_FLAG_HIDDEN);

    lv_obj_add_flag(mlx_bpm_label      , LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(mlx_bpm_bar      , LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(mlx_btn_BPM_start, LV_OBJ_FLAG_HIDDEN);
  }
  lv_obj_scroll_to_y(btn_container, 0, LV_ANIM_OFF);
  lv_obj_update_layout(btn_container);
}

static void MLX_BPM_start_cb(lv_event_t * e)
{
  static bool bpm_start_flag = false;

  lv_obj_t *BPM_start_label = lv_obj_get_child(mlx_btn_BPM_start, 0);

  bpm_start_flag = !bpm_start_flag;

  if (bpm_start_flag)
  {
    mlx_bpm_state = BPM_RUNNING;
    lv_label_set_text(BPM_start_label, LV_SYMBOL_PAUSE );
    lv_label_set_text(mlx_bpm_label, "BPM: --");
  }
  else
  {
    mlx_bpm_state = BPM_PAUSED;
    lv_label_set_text(BPM_start_label, LV_SYMBOL_PLAY);
    lv_label_set_text(mlx_bpm_label, "");
  }
}

static lv_obj_t * create_right_btn_container(lv_obj_t *parent)
{
    lv_obj_t *btn_container = lv_obj_create(parent);

    lv_obj_set_size(btn_container, 80, 320);
    lv_obj_align(btn_container, LV_ALIGN_TOP_RIGHT, -5  , 0);

    lv_obj_set_style_bg_opa(btn_container, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_width(btn_container, 0, 0);
    lv_obj_set_style_outline_width(btn_container, 0, 0);

    lv_obj_set_scroll_dir(btn_container, LV_DIR_VER);
    lv_obj_clear_flag(btn_container, LV_OBJ_FLAG_SCROLL_MOMENTUM);
    lv_obj_set_scrollbar_mode(btn_container, LV_SCROLLBAR_MODE_ON);

    /* flex 세로 정렬 */
    lv_obj_set_flex_flow(btn_container, LV_FLEX_FLOW_COLUMN);
    lv_obj_set_flex_align(btn_container,
        LV_FLEX_ALIGN_START,
        LV_FLEX_ALIGN_CENTER,
        LV_FLEX_ALIGN_START);

    lv_obj_set_style_pad_row(btn_container, 20, 0);

    return btn_container;
}
static lv_obj_t * create_square_btn(lv_obj_t *parent, lv_coord_t size,
                                    const char *text, lv_event_cb_t cb)
{
    lv_obj_t *btn = lv_button_create(parent);
    lv_obj_set_size(btn, size, size);

    lv_obj_t *label = lv_label_create(btn);
    lv_label_set_text(label, text);
    lv_obj_center(label);

    if(cb) {
        lv_obj_add_event_cb(btn, cb, LV_EVENT_CLICKED, NULL);
    }

    return btn;
}

static lv_obj_t * create_color_bar(lv_obj_t *parent)
{
  lv_obj_t *color_bar_canvas = lv_canvas_create(parent);
  lv_canvas_set_buffer(color_bar_canvas, (lv_color_t*)colorbarGetFrameBuffer(), PALETTE_WIDTH, PALETTE_HEIGHT , LV_COLOR_FORMAT_RGB565);
  lv_obj_align(color_bar_canvas, LV_ALIGN_LEFT_MID, 15, 0);
  lv_obj_set_style_border_width(color_bar_canvas, 1, 0);      // 테두리 두께
  lv_obj_set_style_border_color(color_bar_canvas, lv_color_white(), 0);  // 테두리 색
  lv_obj_set_style_border_opa(color_bar_canvas, LV_OPA_COVER, 0);        // 테두리 불투명

  return color_bar_canvas;
}

static lv_obj_t * create_touch_marker(lv_obj_t *parent)
{
  lv_obj_t * touch_marker = lv_obj_create(parent);
  lv_obj_set_size(touch_marker, MARKER_SIZE, MARKER_SIZE);
  lv_obj_set_style_bg_opa(touch_marker, LV_OPA_TRANSP, 0);
  lv_obj_set_style_border_color(touch_marker, lv_color_white(), 0);
  lv_obj_set_style_border_width(touch_marker, 4, 0);
  lv_obj_set_style_radius(touch_marker, 0, 0);
  lv_obj_add_flag(touch_marker, LV_OBJ_FLAG_HIDDEN);

  return touch_marker;
}

static lv_obj_t * create_bpm_bar(lv_obj_t *parent)
{
  // BPM 측정 진행 게이지
  lv_obj_t * bpm_bar_t = lv_bar_create(parent);
  lv_obj_set_size(bpm_bar_t, 20, 240);
  lv_obj_align(bpm_bar_t, LV_ALIGN_LEFT_MID, 20, 0);

  lv_bar_set_range(bpm_bar_t, 0, FFT_BUFFER_SIZE);
  lv_bar_set_value(bpm_bar_t, 0, LV_ANIM_OFF);

  lv_obj_set_style_border_color(bpm_bar_t, lv_color_white(), LV_PART_MAIN);
  lv_obj_set_style_border_width(bpm_bar_t, 2, LV_PART_MAIN);
  lv_obj_set_style_border_opa(bpm_bar_t, LV_OPA_80, LV_PART_MAIN);
  // 색상
  lv_obj_set_style_bg_color(bpm_bar_t, lv_color_hex(0x333333), 0);
  lv_obj_set_style_bg_opa(bpm_bar_t, LV_OPA_50, 0);
  lv_obj_set_style_radius(bpm_bar_t, 4, 0);

  lv_obj_set_style_bg_color(bpm_bar_t, lv_color_hex(0x00FF66),LV_PART_INDICATOR);
  lv_obj_add_flag(bpm_bar_t, LV_OBJ_FLAG_HIDDEN);

  return bpm_bar_t;
}

static void thermal_touch_cb(lv_event_t * e)
{
  lv_point_t touch_point;
  lv_indev_t * indev = lv_event_get_indev(e);
  lv_indev_get_point(indev, &touch_point);

  lv_area_t coords;
  lv_obj_get_coords(thermal_canvas, &coords);

  int32_t rel_x = touch_point.x - coords.x1;
  int32_t rel_y = touch_point.y - coords.y1;

  if (rel_x < 0 || rel_x >= CANVAS_W || rel_y < 0 || rel_y >= CANVAS_H) {
    return;
  }

  // 화면상 터치 위치
  touched_orig_x = rel_x / UPSCALE_SCALE;       // 0~31,
  touched_orig_y = rel_y / UPSCALE_SCALE;       // 0~23

  //좌우 반전
  int data_x = (MLX_W - 1) - touched_orig_x;     // x 좌표 반전

  mlx_index = touched_orig_y * MLX_W + data_x;


  // touch flag update for label
  touch_flag = 1;

  // 마커 위치
  int scaled_x = touched_orig_x * UPSCALE_SCALE + UPSCALE_SCALE / 2;
  int scaled_y = touched_orig_y * UPSCALE_SCALE + UPSCALE_SCALE / 2;

  lv_obj_set_pos(
      touch_marker,
      coords.x1 + scaled_x - MARKER_SIZE / 2,
      coords.y1 + scaled_y - MARKER_SIZE / 2
  );
  lv_obj_clear_flag(touch_marker, LV_OBJ_FLAG_HIDDEN);
}

void update_min_temp_labels()
{
    char buf_min[32];

    float min_temp = mlx90640.min_temp;

    int min_int = (int)min_temp;
    int min_dec = (int)((min_temp - min_int) * 10);


    lv_snprintf(buf_min, sizeof(buf_min), "%d.%d°C", min_int, min_dec);

    lv_label_set_text(label_min, buf_min);
}

void update_max_temp_labels()
{
    char buf_max[32];

    float max_temp = mlx90640.max_temp;

    int max_int = (int)max_temp;
    int max_dec = (int)((max_temp - max_int) * 10);

    lv_snprintf(buf_max, sizeof(buf_max), "%d.%d°C", max_int, max_dec);

    lv_label_set_text(label_max, buf_max);
}

///////////////////////////////////////
static void back_to_main_cb(lv_event_t * e)
{
  current_screen = SCREEN_MAIN;
  bpm_state = BPM_INACTIVE;
  ov7670_stopCap();
  lvgl_launcher();   // 메인 화면 다시 로드
}
static void back_to_heapMap_cb(lv_event_t * e)
{
  current_screen = SCREEN_THERMAL;
  screen_thermal_show();
}
/////////////////////////////////////////////
static void setting_page_cb(lv_event_t * e)
{
  current_screen = SCREEN_THERMAL_SETTINGS;

  lv_obj_t *settings_screen = lv_obj_create(NULL);
  lv_obj_set_style_pad_all(settings_screen, 10, 0);

  lv_obj_clear_flag(settings_screen, LV_OBJ_FLAG_SCROLLABLE);

  /////////  header  ////////////////
  lv_obj_t *header = lv_obj_create(settings_screen);
  lv_obj_set_size(header, LV_PCT(100), 60);
  lv_obj_align(header, LV_ALIGN_TOP_MID, 0, 0);
  lv_obj_set_style_bg_color(header, lv_color_hex(0x2D2D2D), 0);

  lv_obj_clear_flag(header, LV_OBJ_FLAG_SCROLLABLE);        // 스크롤 절대 금지

  lv_obj_t *title = lv_label_create(header);
  lv_label_set_text(title, "THERMAL SETTINGS");
  lv_obj_center(title);
  // back button
  lv_obj_t *btn_back = create_square_btn(header,50,LV_SYMBOL_NEW_LINE,back_to_heapMap_cb);
  lv_obj_align(btn_back, LV_ALIGN_TOP_RIGHT, 0, -10);
  //////////////////////////////////
  ///main setting//
  lv_obj_t *main_area = lv_obj_create(settings_screen);
  lv_obj_set_size(main_area, LV_PCT(100), LV_PCT(100));
  lv_obj_set_style_pad_all(main_area, 10, 0);
  lv_obj_align(main_area, LV_ALIGN_TOP_MID, 0, 70);
  lv_obj_set_flex_flow(main_area, LV_FLEX_FLOW_COLUMN);
  //lv_obj_add_flag(main_area, LV_OBJ_FLAG_SCROLLABLE);
  lv_obj_set_style_bg_color(main_area, lv_color_hex(0x2D2D2D), 0);

  /////// auto Range or Manual
  lv_obj_t *range_panel = lv_btn_create(main_area);
  lv_obj_set_size(range_panel, LV_PCT(100), 140);
  lv_obj_set_flex_flow(range_panel, LV_FLEX_FLOW_COLUMN);
  lv_obj_add_event_cb(range_panel, range_radio_event_cb, LV_EVENT_CLICKED, NULL);

  radiobutton_create(range_panel, "Auto Range");
  radiobutton_create(range_panel, "Manual Range");

  lv_obj_t *manual_options = lv_obj_create(range_panel);
  lv_obj_set_size(manual_options, LV_PCT(100), 60);
  lv_obj_set_flex_flow(manual_options, LV_FLEX_FLOW_ROW);
  lv_obj_set_style_pad_column(manual_options, 10, 0);
  lv_obj_set_style_bg_opa(manual_options, LV_OPA_TRANSP, 0);
  lv_obj_set_style_pad_left(manual_options, 20, 0);
  lv_obj_clear_flag(manual_options, LV_OBJ_FLAG_SCROLLABLE);

  lv_obj_t *lbl_min = lv_label_create(manual_options);
  lv_label_set_text(lbl_min, "Min:");

  lv_obj_t *dd_min = lv_dropdown_create(manual_options);
  lv_dropdown_set_options(dd_min, "-20.0°C\n-10.0°C\n0.0°C\n10.0°C\n20.0°C\n30.0°C\n40.0°C");
  lv_obj_set_width(dd_min, 120);

  lv_obj_add_event_cb(dd_min, min_range_event_handler, LV_EVENT_ALL, NULL);

  lv_obj_t *lbl_max = lv_label_create(manual_options);
  lv_label_set_text(lbl_max, "Max:");

  // Max 드롭다운
  lv_obj_t *dd_max = lv_dropdown_create(manual_options);
  lv_dropdown_set_options(dd_max, "40.0°C\n50.0°C\n60.0°C\n70.0°C\n100.0°C\n200.0°C\n300.0°C");
  lv_obj_set_width(dd_max, 120);

  lv_obj_add_event_cb(dd_max, max_range_event_handler, LV_EVENT_ALL, NULL);

  /////// Palette bar
  lv_obj_t *Palette = lv_btn_create(main_area);
  lv_obj_set_size(Palette, LV_PCT(100), 70);

  lv_obj_t *Palette_label = lv_label_create(Palette);
  lv_label_set_text(Palette_label, "Palette_bar");
  lv_obj_align(Palette_label, LV_ALIGN_LEFT_MID, 0, 0);

  lv_obj_t * Palette_dropdown = lv_dropdown_create(Palette);
      lv_dropdown_set_options(Palette_dropdown, "PLASMA\n"
                              "RAINBOW\n"
                              "VIRIDIS\n"
                              "HOT\n"
                              "SEISMIC\n"
                              "BLACKHOT\n"
                              "WHITEHOT\n"
                              "HOTCOLD");

      lv_obj_align(Palette_dropdown, LV_ALIGN_RIGHT_MID, 0, 0);
      lv_obj_add_event_cb(Palette_dropdown, Palette_event_handler, LV_EVENT_ALL, NULL);

  lv_scr_load(settings_screen);
}

static void marker_cb(lv_event_t * e)
{
  //Marker off
  touch_flag = 0;
  lv_obj_add_flag(touch_marker, LV_OBJ_FLAG_HIDDEN);
  lv_label_set_text(label_temp, "Touch Point: --.-°C");
}
static void pause_cb(lv_event_t * e)
{
  pause_flag = !pause_flag;
}
static void Palette_event_handler(lv_event_t * e)
{
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_VALUE_CHANGED) {
        char buf[32];
        lv_dropdown_get_selected_str(obj, buf, sizeof(buf));

        if(strcmp(buf, "PLASMA") == 0)     current_palette = PALETTE_PLASMA;
        else if(strcmp(buf, "RAINBOW") == 0) current_palette = PALETTE_RAINBOW;
        else if(strcmp(buf, "VIRIDIS") == 0)    current_palette = PALETTE_VIRIDIS;
        else if(strcmp(buf  , "HOT") == 0)    current_palette = PALETTE_HOT;
        else if(strcmp(buf, "SEISMIC") == 0)  current_palette = PALETTE_SEISMIC;
        else if(strcmp(buf, "BLACKHOT") == 0) current_palette = PALETTE_BLACKHOT;
        else if(strcmp(buf, "WHITEHOT") == 0) current_palette = PALETTE_WHITEHOT;
        else if(strcmp(buf, "HOTCOLD") ==  0) current_palette = PALETTE_HOTCOLD;
        palette_generate();
    }
}
static void min_range_event_handler(lv_event_t * e)
{
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_VALUE_CHANGED) {
        char buf[32];
        lv_dropdown_get_selected_str(obj, buf, sizeof(buf));

        if(strcmp(buf, "-20.0°C") == 0)      mlx90640.min_temp = -20.0f;
        else if(strcmp(buf, "-10.0°C") == 0) mlx90640.min_temp = -10.0f;
        else if(strcmp(buf, "0.0°C") == 0)   mlx90640.min_temp =  0.0f;
        else if(strcmp(buf, "10.0°C") == 0)  mlx90640.min_temp =  10.0f;
        else if(strcmp(buf, "20.0°C") == 0)  mlx90640.min_temp =  20.0f;
        else if(strcmp(buf, "30.0°C") == 0)  mlx90640.min_temp =  30.0f;
        else if(strcmp(buf, "40.0°C") == 0)  mlx90640.min_temp =  40.0f;
    }
}
static void max_range_event_handler(lv_event_t * e)
{
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_VALUE_CHANGED) {
        char buf[32];
        lv_dropdown_get_selected_str(obj, buf, sizeof(buf));

        if(strcmp(buf, "40.0°C") == 0)        mlx90640.max_temp = 40.0f;
        else if(strcmp(buf, "50.0°C") == 0)   mlx90640.max_temp = 50.0f;
        else if(strcmp(buf, "60.0°C") == 0)   mlx90640.max_temp = 60.0f;
        else if(strcmp(buf, "70.0°C") == 0)   mlx90640.max_temp = 70.0f;
        else if(strcmp(buf, "100.0°C") == 0)  mlx90640.max_temp = 100.0f;
        else if(strcmp(buf, "200.0°C") == 0)  mlx90640.max_temp = 200.0f;
        else if(strcmp(buf, "300.0°C") == 0)  mlx90640.max_temp = 300.0f;
    }
}

static void radiobutton_create(lv_obj_t * parent, const char * txt)
{
    lv_obj_t * obj = lv_checkbox_create(parent);
    lv_checkbox_set_text(obj, txt);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE);
    lv_obj_add_style(obj, &style_radio, LV_PART_INDICATOR);
    lv_obj_add_style(obj, &style_radio_chk, LV_PART_INDICATOR | LV_STATE_CHECKED);
}

static void range_radio_event_cb(lv_event_t * e)
{
    lv_obj_t *cont = lv_event_get_current_target(e); // range_panel
    lv_obj_t *act_cb = lv_event_get_target(e);       // 클릭한 체크박스
    lv_obj_t *old_cb = lv_obj_get_child(cont, active_range_index);

    if(act_cb == cont) return; // 컨테이너 클릭은 무시

    lv_obj_remove_state(old_cb, LV_STATE_CHECKED);   // 이전 체크 해제
    lv_obj_add_state(act_cb, LV_STATE_CHECKED);      // 현재 체크
    mlx90640.auto_temp = !mlx90640.auto_temp;

    active_range_index = lv_obj_get_index(act_cb);

}

void *CanvasGetFrameBuffer(void)
{
    return (void *)canvas_buffer;
}


