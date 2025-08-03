#include "stm32g4xx_ll_dma.h"
#include "stm32g4xx_ll_tim.h"
#include "stm32g4xx_ll_gpio.h"
#include "stm32g4xx_ll_bus.h"
#include "stm32g4xx_hal_def.h"
#include "stm32g4xx_hal_tim.h"
#include "stm32g4xx_hal_hrtim.h"
#include "stm32g4xx_hal_dma.h"
#include "stm32g4xx_hal_gpio.h"
#include "led.h"

// LED pin definition
#define PIN_LED         LL_GPIO_PIN_15

// WS2812B protocol codes
#define WS2812B_RESET   0
#define WS2812B_0       1
#define WS2812B_1       2
#define WS2812B_END     0xff

// LED data arrays for different states
static const uint8_t led_white128[] = {
    WS2812B_1,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0, // G
    WS2812B_1,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0, // R
    WS2812B_1,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0, // B
    WS2812B_RESET,
    WS2812B_END
};

static const uint8_t led_off[] = {
    WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0, // G
    WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0, // R
    WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0,WS2812B_0, // B
    WS2812B_RESET,
    WS2812B_END
};

static const uint8_t led_reset[] = {
    WS2812B_RESET,
    WS2812B_END
};

// Delay loop macro for timing control
#define DELAY_LOOP_CYCLES(count)                \
    do {                                        \
        register uint32_t _cnt = (count);       \
        __asm__ volatile (                      \
            "1:\n"                              \
            "   subs %[cnt], %[cnt], #1\n"      \
            "   bne 1b\n"                       \
            : [cnt] "+r" (_cnt)                 \
            :                                   \
            : "cc"                              \
        );                                      \
    } while (0)

/**
  * @brief  Send LED data to WS2812B LED strip.
  * @param  led: Pointer to LED data array.
  */
static void sendLed(const uint8_t *led)
{
    for (uint16_t cnt = 0; led[cnt] != WS2812B_END; cnt++) {
        switch (led[cnt]) {
            case WS2812B_RESET:
                LL_GPIO_ResetOutputPin(GPIOA, PIN_LED);
                DELAY_LOOP_CYCLES(10000);
                LL_GPIO_SetOutputPin(GPIOA, PIN_LED);
                break;
            case WS2812B_0:
                LL_GPIO_SetOutputPin(GPIOA, PIN_LED);
                DELAY_LOOP_CYCLES(5);
                LL_GPIO_ResetOutputPin(GPIOA, PIN_LED);
                DELAY_LOOP_CYCLES(20);
                LL_GPIO_SetOutputPin(GPIOA, PIN_LED);
                break;
            case WS2812B_1:
                LL_GPIO_SetOutputPin(GPIOA, PIN_LED);
                DELAY_LOOP_CYCLES(20);
                LL_GPIO_ResetOutputPin(GPIOA, PIN_LED);
                DELAY_LOOP_CYCLES(20);
                LL_GPIO_SetOutputPin(GPIOA, PIN_LED);
                break;
            default:
                // Ignore unknown codes
                break;
        }
    }
}

/**
  * @brief  Initialize the LED GPIO and set to reset state.
  */
void initLed(void)
{
    LL_AHB2_GRP1_EnableClock(LL_AHB2_GRP1_PERIPH_GPIOA);
    LL_GPIO_SetOutputPin(GPIOA, PIN_LED);
    LL_GPIO_SetPinMode(GPIOA, PIN_LED, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinOutputType(GPIOA, PIN_LED, LL_GPIO_OUTPUT_PUSHPULL);
    LL_GPIO_SetPinSpeed(GPIOA, PIN_LED, LL_GPIO_SPEED_FAST);
    LL_GPIO_SetPinPull(GPIOA, PIN_LED, LL_GPIO_PULL_NO);

    setLed(LED_RESET);
}

/**
  * @brief  Set the LED to a specified state.
  * @param  led: LED_STATE enum value.
  */
void setLed(LED_STATE led)
{
    switch (led) {
        case LED_RESET:
            sendLed(led_reset);
            break;
        case LED_OFF:
            sendLed(led_off);
            break;
        case LED_WHITE128:
            sendLed(led_white128);
            break;
        default:
            // Ignore unknown states
            break;
    }
}
