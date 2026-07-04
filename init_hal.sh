#! /bin/bash

  #  HAL
  # │ 󰉋 Include
  # └  Src
  #   │ 󰙱 stm32f4xx_hal.c
  #   │ 󰙱 stm32f4xx_hal_cortex.c
  #   │ 󰙱 stm32f4xx_hal_dma.c
  #   │ 󰙱 stm32f4xx_hal_dma_ex.c
  #   │ 󰙱 stm32f4xx_hal_gpio.c
  #   │ 󰙱 stm32f4xx_hal_rcc.c
  #   │ 󰙱 stm32f4xx_hal_spi.c
  #   │ 󰙱 stm32f4xx_hal_uart.c
  #   └ 󰙱 stm32f4xx_hal_usart.c

export TARGET=HAL

echo "copying HAL"
rm -rf ${TARGET}
mkdir -p git_sources
rm -rf git_sources/stm32f4xx-hal-driver
cd git_sources
git clone https://github.com/STMicroelectronics/stm32f4xx-hal-driver.git --depth=1
cd ..
mkdir -p ${TARGET}/{Include,Src}

cp -R git_sources/stm32f4xx-hal-driver/Inc/** ${TARGET}/Include
cp git_sources/stm32f4xx-hal-driver/Src/{stm32f4xx_hal.c,stm32f4xx_hal_cortex.c,stm32f4xx_hal_dma.c,stm32f4xx_hal_dma_ex.c,stm32f4xx_hal_gpio.c,stm32f4xx_hal_rcc.c,stm32f4xx_hal_spi.c,stm32f4xx_hal_uart.c,stm32f4xx_hal_usart.c} ${TARGET}/Src
cp git_sources/stm32f4xx-hal-driver/Inc/stm32f4xx_hal_conf_template.h Inc/stm32f4xx_hal_conf.h
echo "copy HAL complete"

