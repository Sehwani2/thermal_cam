/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32h7xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define CTP_RST_Pin GPIO_PIN_3
#define CTP_RST_GPIO_Port GPIOE
#define LCD_RST_Pin GPIO_PIN_8
#define LCD_RST_GPIO_Port GPIOI
#define LED1_Pin GPIO_PIN_9
#define LED1_GPIO_Port GPIOI
#define LCD_CS_Pin GPIO_PIN_11
#define LCD_CS_GPIO_Port GPIOI
#define LCD_DC_Pin GPIO_PIN_1
#define LCD_DC_GPIO_Port GPIOA
#define SD_CS_Pin GPIO_PIN_4
#define SD_CS_GPIO_Port GPIOH
#define LCD_LED_Pin GPIO_PIN_3
#define LCD_LED_GPIO_Port GPIOA
#define CAMERA_RESET_Pin GPIO_PIN_6
#define CAMERA_RESET_GPIO_Port GPIOD
#define CTP_INT_Pin GPIO_PIN_13
#define CTP_INT_GPIO_Port GPIOG
#define CAMERA_PWR_DWN_Pin GPIO_PIN_14
#define CAMERA_PWR_DWN_GPIO_Port GPIOG

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
