# Makefile to compile and link code for STM32F411xE

# Compiler and options configuration
CC_SRC = ./xpacks/.bin/
CC = $(CC_SRC)arm-none-eabi-gcc
AS = $(CC_SRC)arm-none-eabi-as
GDB = $(CC_SRC)arm-none-eabi-gdb

CPU = -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard
DEFS = -DSTM32F411xE
DEFS += -DUSE_HAL_DRIVER

# Include files
INCS = -I CMSIS/Device/Include \
			-I CMSIS/Core/Include \
			-I HAL/Include \
			-I Inc

CFLAGS  = $(CPU) $(DEFS) $(INCS)
CFLAGS += -mthumb 
CFLAGS += -g 
CFLAGS += -Os
# CFLAGS += -O0
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -Wl,--no-warn-rwx-segments

ASFLAGS = $(CPU) -mthumb

# Linker flags
LDFLAGS  = -T Linker_script/linker_script.ld -static
LDFLAGS += -Wl,--gc-sections 
# LDFLAGS += -Wl,--print-gc-sections
LDFLAGS += -Wl,-Map=firmware.map
LDFLAGS += -specs=nano.specs -specs=nosys.specs

# Source files
SRCS = Src/main.c 
SRCS += CMSIS/Device/Source/system_stm32f4xx.c 
SRCS += HAL/Src/stm32f4xx_hal.c 
SRCS += HAL/Src/stm32f4xx_hal_gpio.c 
SRCS += HAL/Src/stm32f4xx_hal_rcc.c 
SRCS += HAL/Src/stm32f4xx_hal_spi.c 
SRCS += HAL/Src/stm32f4xx_hal_usart.c 
SRCS += HAL/Src/stm32f4xx_hal_cortex.c 
SRCS += HAL/Src/stm32f4xx_hal_dma.c 
SRCS += HAL/Src/stm32f4xx_hal_dma_ex.c
SRCS += Src/stm32f4xx_it.c 
SRCS += Src/syscalls.c 
SRCS += Src/sysmem.c 
SRCS += Src/usart_init.c 

ASRCS = Startup/startup.s

OBJS = $(ASRCS:.s=.o) $(SRCS:.c=.o) 

# Executable name
TARGET = blink.elf

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(OBJS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

flash:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "program blink.elf verify reset exit"

openocd-serve:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg

gdb:
	$(GDB) $(TARGET)
	# (gdb) target extended-remote localhost:3333
	# (gdb) monitor reset halt
	# monitor arm semihosting enable
	# (gdb) load
	# (gdb) break main
	# (gdb) continue

ex-flash: clean all flash

compile-nvim-lsp:
	compiledb -n make

