#ifndef HW_H_
#define HW_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "hw_def.h"

#include "led.h"
#include "uart.h"
#include "cli.h"
#include "gpio.h"
//#include "button.h"
#include "st7796.h"
#include "lcd.h"
#include "lvgl.h"
#include "ft6336.h"
#include "MLX90640.h"
#include "ov7670.h"

bool hwInit(void);


extern DCMI_HandleTypeDef hdcmi;
extern DMA_HandleTypeDef hdma_dcmi;
extern I2C_HandleTypeDef hi2c4;

#ifdef __cplusplus
}
#endif

#endif
