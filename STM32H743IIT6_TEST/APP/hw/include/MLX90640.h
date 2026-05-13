/*
 * MLX90640.h
 *
 *  Created on: Sep 21, 2025
 *      Author: hyn02
 */

#ifndef MLX90640_H_
#define MLX90640_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "hw_def.h"
#include "MLX90640_API.h"

#ifdef _USE_HW_MLX90640

#define MLX90640_ADDR 0x33

#define  FPS2HZ   0x02
#define  FPS4HZ   0x03
#define  FPS8HZ   0x04
#define  FPS16HZ  0x05
#define  FPS32HZ  0x06

#define MLX_W 32
#define MLX_H 24


typedef struct {
    paramsMLX90640  params;
    float emissivity;           // 방사율 (0~1)
    float Ta_shift;             // 보정값 (ambient offset)
    uint8_t refreshRate;        // 새로고침 속도

    uint16_t eeData[832];       // EEPROM 데이터
    uint16_t frame[834];        // 프레임 버퍼
    float to[768];              // 계산된 온도 값 저장
    uint16_t temp_int[768];     // 정수화한 온도 값
    uint8_t  auto_temp;         // Auto or Manual temp upate
    float min_temp;
    float max_temp;
} MLX90640_HandleTypeDef;

extern MLX90640_HandleTypeDef mlx90640;
extern const uint16_t thermal_colormap[256];

int MLX90640_Init();
int MLX90640_ReadFrame();
uint16_t TempToRGB565(float temp);
uint16_t TempToRGB565_Fixed(float temp);
uint16_t getUpscaledPixel(uint16_t x, uint16_t y);
uint16_t getUpscaledPixelBilinear_Int(uint16_t lcd_x, uint16_t lcd_y);
void BilinearInterpolate_MLX90640(const float *src, uint16_t *dst, int scale, bool flip_horizontal);
#ifdef __cplusplus
}
#endif

#endif

#endif /* HW_INCLUDE_MLX90640_H_ */
