#include "main.h"
#include "usart_init.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
  HAL_Init();
  usart1_init();

  char *text = malloc(sizeof(1000));
  text = realloc(text, sizeof(100));

  __HAL_RCC_GPIOC_CLK_ENABLE();

  GPIO_InitTypeDef gpio = {0};
  gpio.Pin = GPIO_PIN_13;
  gpio.Mode = GPIO_MODE_OUTPUT_PP;
  HAL_GPIO_Init(GPIOC, &gpio);
  HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_SET);

  printf("i see you\n");
  printf("%p\n", text);

  while (1) {
    HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_13);
    HAL_Delay(500);
  }

  return 0;
}
