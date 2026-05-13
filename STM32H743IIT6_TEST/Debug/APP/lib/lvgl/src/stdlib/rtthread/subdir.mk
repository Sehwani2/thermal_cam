################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.c \
../APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.c \
../APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.c 

C_DEPS += \
./APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.d \
./APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.d \
./APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.d 

OBJS += \
./APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.o \
./APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.o \
./APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/stdlib/rtthread/%.o APP/lib/lvgl/src/stdlib/rtthread/%.su APP/lib/lvgl/src/stdlib/rtthread/%.cyclo: ../APP/lib/lvgl/src/stdlib/rtthread/%.c APP/lib/lvgl/src/stdlib/rtthread/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-stdlib-2f-rtthread

clean-APP-2f-lib-2f-lvgl-2f-src-2f-stdlib-2f-rtthread:
	-$(RM) ./APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.cyclo ./APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.d ./APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.o ./APP/lib/lvgl/src/stdlib/rtthread/lv_mem_core_rtthread.su ./APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.cyclo ./APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.d ./APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.o ./APP/lib/lvgl/src/stdlib/rtthread/lv_sprintf_rtthread.su ./APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.cyclo ./APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.d ./APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.o ./APP/lib/lvgl/src/stdlib/rtthread/lv_string_rtthread.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-stdlib-2f-rtthread

