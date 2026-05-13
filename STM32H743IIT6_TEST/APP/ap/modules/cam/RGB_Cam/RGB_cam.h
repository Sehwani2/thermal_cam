
#ifndef RGB_CAM_H_
#define RGB_CAM_H_

#include "ap_def.h"

#ifdef __cplusplus
extern "C" {
#endif

#define FFT_BUFFER_SIZE 128
#define ROI_W 50
#define ROI_H 50
#define ROI_X ((OV7670_QVGA_WIDTH - ROI_W) / 2)
#define ROI_Y ((OV7670_QVGA_HEIGHT - ROI_H) / 2)

void TimerCallback(TIM_HandleTypeDef *htim);

extern volatile float bpm;
extern volatile uint8_t bpm_updated;
extern volatile uint16_t sample_idx;

#ifdef __cplusplus
}
#endif

#endif
