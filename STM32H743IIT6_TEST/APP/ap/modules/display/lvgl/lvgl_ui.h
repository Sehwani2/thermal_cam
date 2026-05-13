/*
 * lvgl_ui.h
 *
 *  Created on: Nov 23, 2025
 *      Author: hyn02
 */

#ifndef LVGL_UI_H_
#define LVGL_UI_H_

#include "ap_def.h"

#define CANVAS_W      320
#define CANVAS_H      240

extern uint16_t canvas_buffer[];
extern lv_obj_t * bpm_label;
extern lv_obj_t * chart;
extern lv_chart_series_t * ser_bpm;

typedef enum {
    SCREEN_MAIN = 0,
    SCREEN_THERMAL,
    SCREEN_RGB,
    SCREEN_THERMAL_SETTINGS,
} ScreenState_t;

typedef enum {
    BPM_INACTIVE,   // BPM 화면 아님
    BPM_READY,      // BPM 화면, 아직 시작 안 함
    BPM_RUNNING,    // 측정 중
    BPM_PAUSED
} bpm_state_t;

extern volatile ScreenState_t current_screen;
extern volatile bpm_state_t bpm_state;
extern volatile bpm_state_t mlx_bpm_state;
extern lv_obj_t *thermal_canvas;

void update_min_temp_labels();
void update_max_temp_labels();
void *CanvasGetFrameBuffer(void);
void *RGBCanvasGetFrameBuffer(void);
#endif
