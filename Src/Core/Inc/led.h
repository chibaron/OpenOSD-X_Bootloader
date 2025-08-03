#ifndef __LED_H
#define __LED_H

#include <stdint.h>

/**
  * @brief  LED state definitions for WS2812B control.
  */
typedef enum {
    LED_RESET = 0,      // Reset state (turn off all LEDs)
    LED_OFF,            // All LEDs off
    LED_WHITE128        // White color, medium brightness
} LED_STATE;

void initLed(void);
void setLed(LED_STATE led);

#endif
