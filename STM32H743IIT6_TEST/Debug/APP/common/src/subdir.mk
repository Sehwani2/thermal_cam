################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/common/src/cli.c \
../APP/common/src/cli_gui.c \
../APP/common/src/qbuffer.c \
../APP/common/src/util.c 

C_DEPS += \
./APP/common/src/cli.d \
./APP/common/src/cli_gui.d \
./APP/common/src/qbuffer.d \
./APP/common/src/util.d 

OBJS += \
./APP/common/src/cli.o \
./APP/common/src/cli_gui.o \
./APP/common/src/qbuffer.o \
./APP/common/src/util.o 


# Each subdirectory must supply rules for building sources it contributes
APP/common/src/%.o APP/common/src/%.su APP/common/src/%.cyclo: ../APP/common/src/%.c APP/common/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-common-2f-src

clean-APP-2f-common-2f-src:
	-$(RM) ./APP/common/src/cli.cyclo ./APP/common/src/cli.d ./APP/common/src/cli.o ./APP/common/src/cli.su ./APP/common/src/cli_gui.cyclo ./APP/common/src/cli_gui.d ./APP/common/src/cli_gui.o ./APP/common/src/cli_gui.su ./APP/common/src/qbuffer.cyclo ./APP/common/src/qbuffer.d ./APP/common/src/qbuffer.o ./APP/common/src/qbuffer.su ./APP/common/src/util.cyclo ./APP/common/src/util.d ./APP/common/src/util.o ./APP/common/src/util.su

.PHONY: clean-APP-2f-common-2f-src

