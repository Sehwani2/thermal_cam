################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 

OBJS += \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/renesas/dave2d/%.o APP/lib/lvgl/src/draw/renesas/dave2d/%.su APP/lib/lvgl/src/draw/renesas/dave2d/%.cyclo: ../APP/lib/lvgl/src/draw/renesas/dave2d/%.c APP/lib/lvgl/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./APP/lib/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

