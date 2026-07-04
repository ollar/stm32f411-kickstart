#! /bin/bash

#  CMSIS
#   │  Core
#   │ └  Include
#   │   │  m-profile
#   │   │ │ 󰫵 armv7m_mpu.h
#   │   │ └ 󰫵 cmsis_gcc_m.h
#   │   │ 󰫵 cmsis_compiler.h
#   │   │ 󰫵 cmsis_gcc.h
#   │   │ 󰫵 cmsis_version.h
#   │   └ 󰫵 core_cm4.h

export TARGET=CMSIS

echo "copying CMSIS Core"
rm -rf ${TARGET}
mkdir -p git_sources
rm -rf git_sources/CMSIS_6
cd git_sources
git clone https://github.com/ARM-software/CMSIS_6 --depth=1
cd ..
mkdir -p ${TARGET}/Core/Include/m-profile

cp git_sources/CMSIS_6/CMSIS/Core/Include/{cmsis_compiler.h,cmsis_gcc.h,cmsis_version.h,core_cm4.h} ${TARGET}/Core/Include 
cp git_sources/CMSIS_6/CMSIS/Core/Include/m-profile/{armv7m_mpu.h,cmsis_gcc_m.h} ${TARGET}/Core/Include/m-profile
echo "CMSIS Core complete"

#  CMSIS
#   └  Device
#     │  Include
#     │ │ 󰫵 stm32f411xe.h
#     │ │ 󰫵 stm32f4xx.h
#     │ └ 󰫵 system_stm32f4xx.h
#     └  Source
#       └ 󰙱 system_stm32f4xx.c

echo "copying CMSIS Device"
mkdir -p git_sources
rm -rf git_sources/cmsis-device-f4
cd git_sources
git clone https://github.com/STMicroelectronics/cmsis-device-f4 --depth=1 
cd ..
mkdir -p ${TARGET}/Device/{Include,Source}
cp git_sources/cmsis-device-f4/Include/{stm32f411xe.h,stm32f4xx.h,system_stm32f4xx.h} ${TARGET}/Device/Include
cp git_sources/cmsis-device-f4/Source/Templates/system_stm32f4xx.c ${TARGET}/Device/Source
echo "CMSIS Device complete"
