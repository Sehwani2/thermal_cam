################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/hw/src/lvgl/lv_port_disp.c \
../APP/hw/src/lvgl/lv_port_indev.c 

C_DEPS += \
./APP/hw/src/lvgl/lv_port_disp.d \
./APP/hw/src/lvgl/lv_port_indev.d 

OBJS += \
./APP/hw/src/lvgl/lv_port_disp.o \
./APP/hw/src/lvgl/lv_port_indev.o 


# Each subdirectory must supply rules for building sources it contributes
APP/hw/src/lvgl/%.o APP/hw/src/lvgl/%.su APP/hw/src/lvgl/%.cyclo: ../APP/hw/src/lvgl/%.c APP/hw/src/lvgl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-hw-2f-src-2f-lvgl

clean-APP-2f-hw-2f-src-2f-lvgl:
	-$(RM) ./APP/hw/src/lvgl/lv_port_disp.cyclo ./APP/hw/src/lvgl/lv_port_disp.d ./APP/hw/src/lvgl/lv_port_disp.o ./APP/hw/src/lvgl/lv_port_disp.su ./APP/hw/src/lvgl/lv_port_indev.cyclo ./APP/hw/src/lvgl/lv_port_indev.d ./APP/hw/src/lvgl/lv_port_indev.o ./APP/hw/src/lvgl/lv_port_indev.su

.PHONY: clean-APP-2f-hw-2f-src-2f-lvgl

