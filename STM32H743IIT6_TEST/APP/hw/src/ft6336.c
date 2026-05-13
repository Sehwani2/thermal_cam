#include "ft6336.h"
#include "led.h"
#include "gpio.h"

#ifdef _USE_HW_FT6336

/*===========================
    내부 변수 / 핸들
===========================*/
extern I2C_HandleTypeDef hi2c1;     // HW I2C 사용

_m_tp_dev tp_dev =
{
    FT6336_Init,
    FT6336_Scan,
    {0},
    {0},
    0
};

/* FT6336 레지스터 테이블 */
static const uint16_t FT6336_TPX_TBL[CTP_MAX_TOUCH] = { FT_TP1_REG, FT_TP2_REG };


/*==========================================================
    FT6336 I2C 하드웨어 Read / Write
==========================================================*/

uint8_t FT6336_WR_Reg(uint16_t reg, uint8_t *buf, uint8_t len)
{
    /* 레지스터는 8비트임 → 반드시 마스킹 */
    uint8_t r = reg & 0xFF;

    if(HAL_I2C_Mem_Write(&hi2c1,
                         FT_ID,
                         r,
                         I2C_MEMADD_SIZE_8BIT,
                         buf,
                         len,
                         20) == HAL_OK)
    {
        return 0;
    }
    return 1;
}

uint8_t FT6336_RD_Reg(uint16_t reg, uint8_t *buf, uint8_t len)
{
    uint8_t r = reg & 0xFF;

    if(HAL_I2C_Mem_Read(&hi2c1,
                        FT_ID,
                        r,
                        I2C_MEMADD_SIZE_8BIT,
                        buf,
                        len,
                        20) == HAL_OK)
    {
        return 0;
    }
    return 1;
}



/*==========================================================
    FT6336 초기화
==========================================================*/
uint8_t FT6336_Init(void)
{
    uint8_t temp[2];

    // 하드웨어 리셋
    HAL_GPIO_WritePin(CTP_RST_GPIO_Port, CTP_RST_Pin, GPIO_PIN_RESET);
    HAL_Delay(50);
    HAL_GPIO_WritePin(CTP_RST_GPIO_Port, CTP_RST_Pin, GPIO_PIN_SET);
    HAL_Delay(200);
//     FocalTech ID 확인
    FT6336_RD_Reg(FT_ID_G_FOCALTECH_ID, temp, 1);
    if(temp[0] != 0x11) return 1;

//    // 중간 ID
//    FT6336_RD_Reg(FT_ID_G_CIPHER_MID, temp, 2);
//    if(temp[0] != 0x26) return 1;
//
//    // HIGH ID
//    FT6336_RD_Reg(FT_ID_G_CIPHER_HIGH, temp, 1);
//    if(temp[0] != 0x64) return 1;

    return 0;
}


/*==========================================================
    터치 스캔
==========================================================*/
uint8_t FT6336_Scan(void)
{
    uint8_t buf[4];
    uint8_t res = 0;
    uint8_t temp;
    static uint8_t t = 0;

    t++;

    if((t % 3) == 0 || t < 3)
    {
        FT6336_RD_Reg(FT_REG_NUM_FINGER, &temp, 1);

        if((temp & 0x0F) && ((temp & 0x0F) <= CTP_MAX_TOUCH))
        {
            tp_dev.sta = (~(0xFF << (temp & 0x0F))) | TP_PRES_DOWN | TP_CATH_PRES;

            for(uint8_t i = 0; i < CTP_MAX_TOUCH; i++)
            {
                FT6336_RD_Reg(FT6336_TPX_TBL[i], buf, 4);

                if(tp_dev.sta & (1 << i))
                {
                    uint16_t x = ((buf[0] & 0x0F) << 8) + buf[1];
                    uint16_t y = ((buf[2] & 0x0F) << 8) + buf[3];

                    tp_dev.x[i] = LCD_WIDTH - y;
                    tp_dev.y[i] = x;


                }
            }

            res = 1;
            if(tp_dev.x[0] == 0 && tp_dev.y[0] == 0) temp = 0;
            t = 0;
        }
    }

    if(temp == 0)
    {
        if(tp_dev.sta & TP_PRES_DOWN)
        {
            tp_dev.sta &= ~(1 << 7);
        }
        else
        {
            tp_dev.x[0] = 0xFFFF;
            tp_dev.y[0] = 0xFFFF;
            tp_dev.sta &= 0xE0;
        }
    }

    if(t > 240) t = 3;

    return res;
}


/*==========================================================
    터치 드라이버 초기화 (외부 호출)
==========================================================*/

#ifdef HW_TOUCH_LVGL

uint8_t touch_Init(void)
{
  if(FT6336_Init())
    return 1;

  //tp_dev.scan = FT6336_Scan;
  return 0;
}

bool    touch_is_pressed(void)
{
  return (tp_dev.sta & TP_PRES_DOWN) ? true : false;
}

void    touch_get_xy(int32_t *x, int32_t *y)
{
//  if(tp_dev.sta & TP_PRES_DOWN)
//  {
//    *x = tp_dev.x[0];
//    *y = tp_dev.y[0];
//  }
//  else
//  {
//    *x = 0;
//    *y = 0;
//  }
      *x = tp_dev.x[0];
      *y = tp_dev.y[0];
}

#endif

#endif
