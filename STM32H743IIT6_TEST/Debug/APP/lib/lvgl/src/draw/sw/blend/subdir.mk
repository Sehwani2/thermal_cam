################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.c \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.c \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.c \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.c \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.c \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.c \
../APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d 

OBJS += \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o \
./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/sw/blend/%.o APP/lib/lvgl/src/draw/sw/blend/%.su APP/lib/lvgl/src/draw/sw/blend/%.cyclo: ../APP/lib/lvgl/src/draw/sw/blend/%.c APP/lib/lvgl/src/draw/sw/blend/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend:
	-$(RM) ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend.su ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.su ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.su ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.su ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.su ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.su ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.cyclo ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o ./APP/lib/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

