1. repo - <https://github.com/ARM-software/CMSIS_6/tree/main> copy files: 
```
   CMSIS
  │  Core
  │ └  Include
  │   │  m-profile
  │   │ │ 󰫵 armv7m_mpu.h
  │   │ └ 󰫵 cmsis_gcc_m.h
  │   │ 󰫵 cmsis_compiler.h
  │   │ 󰫵 cmsis_gcc.h
  │   │ 󰫵 cmsis_version.h
  │   └ 󰫵 core_cm4.h
```

2. repo - <https://github.com/STMicroelectronics/cmsis-device-f4> copy files:
```
   CMSIS
  └  Device
    │  Include
    │ │ 󰫵 stm32f411xe.h
    │ │ 󰫵 stm32f4xx.h
    │ └ 󰫵 system_stm32f4xx.h
    └  Source
      └ 󰙱 system_stm32f4xx.c
```

3. repo - <https://github.com/STMicroelectronics/stm32f4xx-hal-driver.git> copy files:
```
Inc -> HAL/Include

   HAL
  │ 󰉋 Include
  └  Src
    │ 󰙱 stm32f4xx_hal.c
    │ 󰙱 stm32f4xx_hal_cortex.c
    │ 󰙱 stm32f4xx_hal_dma.c
    │ 󰙱 stm32f4xx_hal_dma_ex.c
    │ 󰙱 stm32f4xx_hal_gpio.c
    │ 󰙱 stm32f4xx_hal_rcc.c
    │ 󰙱 stm32f4xx_hal_spi.c
    │ 󰙱 stm32f4xx_hal_uart.c
    └ 󰙱 stm32f4xx_hal_usart.c

cp Inc/stm32f4xx_hal_conf_template.h Inc/stm32f4xx_hal_conf.h 
```

4. <https://github.com/STMicroelectronics/STM32CubeF4/blob/master/Projects/STM32446E_EVAL/Templates/Src/stm32f4xx_it.c>
  <https://github.com/STMicroelectronics/STM32CubeF4/blob/master/Projects/STM32446E_EVAL/Templates/Inc/main.h>
  <https://github.com/STMicroelectronics/STM32CubeF4/blob/master/Projects/STM32446E_EVAL/Templates/Inc/stm32f4xx_it.h>
  <https://github.com/STMicroelectronics/STM32CubeF4/blob/master/Projects/STM32F411RE-Nucleo/Templates/STM32CubeIDE/Example/User/syscalls.c>
  <https://github.com/STMicroelectronics/STM32CubeF4/blob/master/Projects/STM324xG_EVAL/Templates/STM32CubeIDE/Example/User/sysmem.c> ???
