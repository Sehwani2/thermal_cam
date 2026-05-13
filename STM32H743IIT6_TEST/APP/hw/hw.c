#include "hw.h"
#include "FreeRTOS.h"
#include "task.h"

extern DCMI_HandleTypeDef hdcmi;
extern DMA_HandleTypeDef hdma_dcmi;
extern I2C_HandleTypeDef hi2c3;
extern I2C_HandleTypeDef hi2c4;




bool hwInit(void)
{
	// 하드웨어 초기화 함수
  cliInit();
  ledInit();
  uartInit();
  gpioInit();
//  buttonInit();
  st7796Init();
  lcdInit();
  FT6336_Init();
  MLX90640_Init();
  ov7670_init(&hdcmi, &hdma_dcmi, &hi2c3);



  return true;
}

void delay(uint32_t ms)
{
  if (xTaskGetSchedulerState() != taskSCHEDULER_RUNNING)
  {
    HAL_Delay(ms);
  }
  else
  {
    osDelay(ms);
  }
}

uint32_t millis(void)
{
    if (xTaskGetSchedulerState() != taskSCHEDULER_RUNNING)
    {
        return HAL_GetTick();
    }
    else
    {
        return osKernelGetTickCount();
    }
}

