################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/others/snapshot/lv_snapshot.c 

C_DEPS += \
./APP/lib/lvgl/src/others/snapshot/lv_snapshot.d 

OBJS += \
./APP/lib/lvgl/src/others/snapshot/lv_snapshot.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/others/snapshot/%.o APP/lib/lvgl/src/others/snapshot/%.su APP/lib/lvgl/src/others/snapshot/%.cyclo: ../APP/lib/lvgl/src/others/snapshot/%.c APP/lib/lvgl/src/others/snapshot/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-others-2f-snapshot

clean-APP-2f-lib-2f-lvgl-2f-src-2f-others-2f-snapshot:
	-$(RM) ./APP/lib/lvgl/src/others/snapshot/lv_snapshot.cyclo ./APP/lib/lvgl/src/others/snapshot/lv_snapshot.d ./APP/lib/lvgl/src/others/snapshot/lv_snapshot.o ./APP/lib/lvgl/src/others/snapshot/lv_snapshot.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-others-2f-snapshot

