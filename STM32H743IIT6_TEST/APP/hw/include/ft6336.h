
#ifndef HW_FT6336_H_
#define HW_FT6336_H_

#include "hw_def.h"

#ifdef _USE_HW_FT6336

#include "lcd.h"

/* 최대 터치 포인트 */
#define CTP_MAX_TOUCH  2

/* 상태 플래그 */
#define TP_PRES_DOWN 0x80
#define TP_CATH_PRES 0x40

/* 구조체 */
typedef struct
{
    uint8_t (*init)(void);
    uint8_t (*scan)(void);
    uint16_t x[CTP_MAX_TOUCH];
    uint16_t y[CTP_MAX_TOUCH];
    uint8_t sta;

} _m_tp_dev;

extern _m_tp_dev tp_dev;

/* I2C 주소 */
#define FT_ID   (0x38 << 1)



/* 주요 레지스터 */
#define FT_DEVIDE_MODE     0x00
#define FT_REG_NUM_FINGER  0x02
#define FT_TP1_REG         0x03
#define FT_TP2_REG         0x09

#define FT_ID_G_CIPHER_MID   0x9F
#define FT_ID_G_CIPHER_LOW   0xA0
#define FT_ID_G_LIB_VERSION  0xA1
#define FT_ID_G_CIPHER_HIGH  0xA3
#define FT_ID_G_MODE         0xA4
#define FT_ID_G_FOCALTECH_ID 0xA8

/* 함수 */
uint8_t FT6336_WR_Reg(uint16_t reg, uint8_t *buf, uint8_t len);
uint8_t FT6336_RD_Reg(uint16_t reg, uint8_t *buf, uint8_t len);
uint8_t FT6336_Init(void);
uint8_t FT6336_Scan(void);

#ifdef HW_TOUCH_LVGL
uint8_t touch_Init(void);
bool    touch_is_pressed(void);
void    touch_get_xy(int32_t *x, int32_t *y);

#endif
#endif

#endif /* HW_INCLUDE_FT6336_H_ */
