#ifndef ST7796_H_
#define ST7796_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "hw_def.h"


#ifdef _USE_HW_ST7796


#include "st7796_regs.h"



enum class_color
{
 white     = 0xFFFF,
 gray      = 0x8410,
 darkgray  = 0xAD55,
 black     = 0x0000,
 purple    = 0x8010,
 pink      = 0xFE19,
 red       = 0xF800,
 orange    = 0xFD20,
 brown     = 0xA145,
 beige     = 0xF7BB,
 yellow    = 0xFFE0,
 lightgreen= 0x9772,
 green     = 0x07E0,
 darkblue  = 0x0011,
 blue      = 0x001F,
 lightblue = 0xAEDC,
};

typedef struct
{
  uint32_t req_time;
} st7796_info_t;


bool st7796Init(void);
bool st7796IsReady(void);
void st7796GetInfo(st7796_info_t *p_info);
void st7796SetWindow(int32_t x, int32_t y, int32_t w, int32_t h);
bool st7796SendBuffer(uint8_t *p_data, uint32_t length, uint32_t timeout_ms);

uint16_t st7796GetWidth(void);
uint16_t st7796GetHeight(void);

void st7796FillRect(int32_t x, int32_t y, int32_t w, int32_t h, uint32_t color);

#endif

#ifdef __cplusplus
}
#endif

#endif
