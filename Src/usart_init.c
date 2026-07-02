#include "stm32f4xx_hal.h"

void usart1_init(void) {
  // 1. Включаем тактирование GPIOA и USART1
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_USART1_CLK_ENABLE();

  // 2. Настраиваем пины на альтернативную функцию AF7 (USART1)
  GPIO_InitTypeDef gpio = {0};

  // PA9  -> TX (передача)
  gpio.Pin = GPIO_PIN_9;
  gpio.Mode = GPIO_MODE_AF_PP;
  gpio.Pull = GPIO_PULLUP;
  gpio.Speed = GPIO_SPEED_FREQ_HIGH;
  gpio.Alternate = GPIO_AF7_USART1;
  HAL_GPIO_Init(GPIOA, &gpio);

  // PA10 -> RX (приём)
  gpio.Pin = GPIO_PIN_10;
  HAL_GPIO_Init(GPIOA, &gpio);

  // 3. Конфигурируем USART1
  //    После сброса F411 работает на HSI 16 МГц, APB2 = 16 МГц.
  //    BRR считается автоматически через HAL:
  uint32_t apb2_freq = HAL_RCC_GetPCLK2Freq();
  USART1->BRR = (apb2_freq + 115200u / 2u) / 115200u;

  // Включаем передатчик (TE), приёмник (RE) и сам USART (UE)
  USART1->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
}
