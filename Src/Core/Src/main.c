/**
  ******************************************************************************
  * @file    main.c
  * @author  MCD Application Team
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm32g4xx_ll_rcc.h"
#include "stm32g4xx_ll_bus.h"
#include "stm32g4xx_ll_rtc.h"
#include "stm32g4xx_ll_pwr.h"
#include "stm32g4xx_hal_tim.h"
#include <stdbool.h>
#include "led.h"
#include "main.h"
#include "app_openbootloader.h"

/* Private typedef -----------------------------------------------------------*/
typedef void (*pFunction)(void);
/* Private define ------------------------------------------------------------*/
#define APP_HEADER_ADDRESS       0x08004000
#define APP_ADDRESS             (APP_HEADER_ADDRESS + 0x200)
#define BOOTLOADER_DFU_MAGIC    0x8FA3D62C
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
CRC_HandleTypeDef hcrc;
/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void JumpToApplication(void);
static bool IsBootloaderRequired(void);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main(void)
{

  /* STM32G4xx HAL library initialization:
       - Configure the Flash prefetch, Flash preread and Buffer caches
       - Systick timer is configured by default as source of time base, but user
             can eventually implement his proper time base source (a general purpose
             timer for example or other time source), keeping in mind that Time base
             duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined and
             handled in milliseconds basis.
       - Low Level Initialization
     */
  HAL_Init();

  /* Configure the System clock */
  SystemClock_Config();
    if ( !IsBootloaderRequired() ){
      JumpToApplication();
    }

  OpenBootloader_Init();

  initLed();
  setLed(LED_WHITE128);

  /* Infinite loop */
  while (true)
  {
    OpenBootloader_ProtocolDetection();
  }
}

/**
  * @brief  System Clock Configuration
  * @param  None
  * @retval None
  */
static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};

  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);

  /* Activate PLL with HSI as source */
  RCC_OscInitStruct.OscillatorType      = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.HSIState            = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState        = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource       = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM            = RCC_PLLM_DIV4;
  RCC_OscInitStruct.PLL.PLLN            = 36;
  RCC_OscInitStruct.PLL.PLLP            = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ            = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR            = RCC_PLLR_DIV2;

  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    NVIC_SystemReset();
  }

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
  clocks dividers */
  RCC_ClkInitStruct.ClockType           = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | \
                                           RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource        = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider       = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider      = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider      = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
    NVIC_SystemReset();
  }
}

/**
  * @brief  Determines whether the bootloader should be entered.
  * @retval true: Bootloader entry required / false: Jump to application
  *
  * Checks RTC backup register for a magic value and verifies the application
  * area CRC to decide if bootloader mode is needed.
  */
static bool IsBootloaderRequired(void)
{
    uint32_t size;
    uint32_t header_crc, crc;

    // Enable RTC backup register access and check for magic value
    LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_PWR);
    LL_PWR_EnableBkUpAccess();
    LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_RTCAPB);
    LL_RCC_EnableRTC();
    if ( BOOTLOADER_DFU_MAGIC == LL_RTC_BKP_GetRegister(RTC, LL_RTC_BKP_DR0) ){
        // Magic value found, request bootloader entry
        TAMP->BKP0R = 0;
        return true;
    }

    // Read application header for size and CRC
    size = *(__IO uint32_t*)APP_HEADER_ADDRESS;
    header_crc = *(__IO uint32_t*)(APP_HEADER_ADDRESS + 4);
    if (size == 0xffffffff){
        // No valid application, request bootloader entry
        return true;
    }

    // Calculate CRC of application area and compare with header
    __HAL_RCC_CRC_CLK_ENABLE();
    hcrc.Instance = CRC;
    hcrc.Init.DefaultPolynomialUse = DEFAULT_POLYNOMIAL_ENABLE;
    hcrc.Init.DefaultInitValueUse = DEFAULT_INIT_VALUE_ENABLE;
    hcrc.Init.InputDataInversionMode = CRC_INPUTDATA_INVERSION_NONE;
    hcrc.Init.OutputDataInversionMode = CRC_OUTPUTDATA_INVERSION_DISABLE;
    hcrc.InputDataFormat = CRC_INPUTDATA_FORMAT_WORDS;
    HAL_CRC_Init(&hcrc);
    crc = HAL_CRC_Calculate(&hcrc, (uint32_t*)APP_ADDRESS, size>>2);

    if ( crc != header_crc ){
        // CRC mismatch, request bootloader entry
        return true;
    }

    HAL_CRC_DeInit(&hcrc);

    // Application is valid, no need to enter bootloader
    return false;
}

/**
  * @brief  Jumps to the user application.
  *
  * This function sets the main stack pointer to the application's initial value,
  * retrieves the application's reset handler address, deinitializes system peripherals,
  * and then transfers control to the user application.
  */
static void JumpToApplication(void)
{
    uint32_t appStack = *(__IO uint32_t*)APP_ADDRESS;
    uint32_t appResetHandler = *(__IO uint32_t*)(APP_ADDRESS + 4);

    __set_MSP(appStack);
    pFunction appEntry = (pFunction)appResetHandler;
    System_DeInit();

    // Jump to user application
    appEntry();
}

void System_DeInit(void)
{
  HAL_RCC_DeInit();
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  while (true)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (true)
  {
  }
}
#endif


