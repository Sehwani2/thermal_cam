################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.c \
../APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.d \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.d 

OBJS += \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.o \
./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/nxp/vglite/%.o APP/lib/lvgl/src/draw/nxp/vglite/%.su APP/lib/lvgl/src/draw/nxp/vglite/%.cyclo: ../APP/lib/lvgl/src/draw/nxp/vglite/%.c APP/lib/lvgl/src/draw/nxp/vglite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-vglite

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-vglite:
	-$(RM) ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_buf_vglite.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_border.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_fill.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_img.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_label.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_layer.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_line.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_triangle.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_buf.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_matrix.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_path.su ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.cyclo ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.d ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.o ./APP/lib/lvgl/src/draw/nxp/vglite/lv_vglite_utils.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-vglite

