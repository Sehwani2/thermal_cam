################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.c \
../APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.d \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.d 

OBJS += \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.o \
./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/vg_lite/%.o APP/lib/lvgl/src/draw/vg_lite/%.su APP/lib/lvgl/src/draw/vg_lite/%.cyclo: ../APP/lib/lvgl/src/draw/vg_lite/%.c APP/lib/lvgl/src/draw/vg_lite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-vg_lite

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-vg_lite:
	-$(RM) ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_buf_vg_lite.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_arc.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_border.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_box_shadow.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_fill.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_img.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_label.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_layer.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_line.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_mask_rect.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_triangle.su ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.d ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.o ./APP/lib/lvgl/src/draw/vg_lite/lv_draw_vg_lite_vector.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_decoder.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_grad.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_math.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_path.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_pending.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_stroke.su ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.cyclo ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.d ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.o ./APP/lib/lvgl/src/draw/vg_lite/lv_vg_lite_utils.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-vg_lite

