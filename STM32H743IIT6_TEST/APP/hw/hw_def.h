#ifndef HW_DEF_H_
#define HW_DEF_H_


#include "main.h"
#include "def.h"
#include "cmsis_os.h"


// 하드웨어 정의 추가
//
//led
#define _USE_HW_LED
#define      HW_LED_MAX_CH          1
//uart
#define _USE_HW_UART
#define      HW_UART_MAX_CH         1
//CLI
#define _USE_HW_CLI
#define      HW_CLI_CMD_LIST_MAX    32
#define      HW_CLI_CMD_NAME_MAX    16
#define      HW_CLI_LINE_HIS_MAX    8
#define      HW_CLI_LINE_BUF_MAX    64
// lcd - gpio
#define _USE_HW_GPIO
#define      HW_GPIO_MAX_CH         4
// button
//#define _USE_HW_BUTTON
//#define      HW_BUTTON_MAX_CH       1
// st7789
#define _USE_HW_ST7796
#define      HW_ST7796_WIDTH       480
#define      HW_ST7796_HEIGHT      320
//// lcd
#define _USE_HW_LCD
#define      HW_LCD_LVGL            1
#define      HW_LCD_WIDTH           480
#define      HW_LCD_HEIGHT          320
// ft6336
#define _USE_HW_FT6336
#define      HW_TOUCH_LVGL          1
/// LVGL
#define _USE_HW_LVGL

//mlx90640
#define _USE_HW_MLX90640
// ov7670
#define _USE_HW_OV7670

// 공통 사용 함수
//
#define logPrintf printf

void     delay(uint32_t ms);
uint32_t millis(void);


#endif
