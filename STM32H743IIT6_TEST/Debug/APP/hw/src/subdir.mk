################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/hw/src/MLX90640.c \
../APP/hw/src/MLX90640_API.c \
../APP/hw/src/MLX90640_I2C_Driver.c \
../APP/hw/src/button.c \
../APP/hw/src/ft6336.c \
../APP/hw/src/gpio.c \
../APP/hw/src/lcd.c \
../APP/hw/src/led.c \
../APP/hw/src/lvgl.c \
../APP/hw/src/ov7670.c \
../APP/hw/src/st7796.c \
../APP/hw/src/uart.c 

C_DEPS += \
./APP/hw/src/MLX90640.d \
./APP/hw/src/MLX90640_API.d \
./APP/hw/src/MLX90640_I2C_Driver.d \
./APP/hw/src/button.d \
./APP/hw/src/ft6336.d \
./APP/hw/src/gpio.d \
./APP/hw/src/lcd.d \
./APP/hw/src/led.d \
./APP/hw/src/lvgl.d \
./APP/hw/src/ov7670.d \
./APP/hw/src/st7796.d \
./APP/hw/src/uart.d 

OBJS += \
./APP/hw/src/MLX90640.o \
./APP/hw/src/MLX90640_API.o \
./APP/hw/src/MLX90640_I2C_Driver.o \
./APP/hw/src/button.o \
./APP/hw/src/ft6336.o \
./APP/hw/src/gpio.o \
./APP/hw/src/lcd.o \
./APP/hw/src/led.o \
./APP/hw/src/lvgl.o \
./APP/hw/src/ov7670.o \
./APP/hw/src/st7796.o \
./APP/hw/src/uart.o 


# Each subdirectory must supply rules for building sources it contributes
APP/hw/src/%.o APP/hw/src/%.su APP/hw/src/%.cyclo: ../APP/hw/src/%.c APP/hw/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-hw-2f-src

clean-APP-2f-hw-2f-src:
	-$(RM) ./APP/hw/src/MLX90640.cyclo ./APP/hw/src/MLX90640.d ./APP/hw/src/MLX90640.o ./APP/hw/src/MLX90640.su ./APP/hw/src/MLX90640_API.cyclo ./APP/hw/src/MLX90640_API.d ./APP/hw/src/MLX90640_API.o ./APP/hw/src/MLX90640_API.su ./APP/hw/src/MLX90640_I2C_Driver.cyclo ./APP/hw/src/MLX90640_I2C_Driver.d ./APP/hw/src/MLX90640_I2C_Driver.o ./APP/hw/src/MLX90640_I2C_Driver.su ./APP/hw/src/button.cyclo ./APP/hw/src/button.d ./APP/hw/src/button.o ./APP/hw/src/button.su ./APP/hw/src/ft6336.cyclo ./APP/hw/src/ft6336.d ./APP/hw/src/ft6336.o ./APP/hw/src/ft6336.su ./APP/hw/src/gpio.cyclo ./APP/hw/src/gpio.d ./APP/hw/src/gpio.o ./APP/hw/src/gpio.su ./APP/hw/src/lcd.cyclo ./APP/hw/src/lcd.d ./APP/hw/src/lcd.o ./APP/hw/src/lcd.su ./APP/hw/src/led.cyclo ./APP/hw/src/led.d ./APP/hw/src/led.o ./APP/hw/src/led.su ./APP/hw/src/lvgl.cyclo ./APP/hw/src/lvgl.d ./APP/hw/src/lvgl.o ./APP/hw/src/lvgl.su ./APP/hw/src/ov7670.cyclo ./APP/hw/src/ov7670.d ./APP/hw/src/ov7670.o ./APP/hw/src/ov7670.su ./APP/hw/src/st7796.cyclo ./APP/hw/src/st7796.d ./APP/hw/src/st7796.o ./APP/hw/src/st7796.su ./APP/hw/src/uart.cyclo ./APP/hw/src/uart.d ./APP/hw/src/uart.o ./APP/hw/src/uart.su

.PHONY: clean-APP-2f-hw-2f-src

