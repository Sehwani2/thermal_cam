
#ifndef THERMAL_CAM_H_
#define THERMAL_CAM_H_

#include "ap_def.h"

bool thermalInit(void);
#define UPSCALE_SCALE 10

#define MLX_FFT_BUFFER_SIZE 256

extern volatile float mlx_bpm;
extern volatile uint8_t mlx_bpm_updated;
extern volatile uint16_t bpm_idx;

#endif
