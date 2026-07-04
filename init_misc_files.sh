#! /bin/bash

echo "copying misc files"

wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM32446E_EVAL/Templates/Src/stm32f4xx_it.c -O Src/stm32f4xx_it.c
wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM32446E_EVAL/Templates/Inc/main.h -O Inc/main.h
wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM32446E_EVAL/Templates/Inc/stm32f4xx_it.h -O Inc/stm32f4xx_it.h
wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM32F411RE-Nucleo/Templates/STM32CubeIDE/Example/User/syscalls.c -O Src/syscalls.c
wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM32F411RE-Nucleo/Templates/Src/main.c -O Src/main.c
wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM324xG_EVAL/Templates/STM32CubeIDE/Example/User/sysmem.c -O Src/sysmem.c
wget https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/refs/heads/master/Projects/STM32F411RE-Nucleo/Templates/STM32CubeIDE/STM32F411RETX_FLASH.ld -O Linker_script/linker_script.ld

echo "copy misc complete"

