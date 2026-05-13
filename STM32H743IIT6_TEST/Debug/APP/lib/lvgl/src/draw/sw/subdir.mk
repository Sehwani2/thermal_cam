################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.c \
../APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.d \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.d 

OBJS += \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.o \
./APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/sw/%.o APP/lib/lvgl/src/draw/sw/%.su APP/lib/lvgl/src/draw/sw/%.cyclo: ../APP/lib/lvgl/src/draw/sw/%.c APP/lib/lvgl/src/draw/sw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw:
	-$(RM) ./APP/lib/lvgl/src/draw/sw/lv_draw_sw.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_arc.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_border.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_box_shadow.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_fill.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_img.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_letter.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_line.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_mask_rect.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_transform.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_triangle.su ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.cyclo ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.d ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.o ./APP/lib/lvgl/src/draw/sw/lv_draw_sw_vector.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-sw

