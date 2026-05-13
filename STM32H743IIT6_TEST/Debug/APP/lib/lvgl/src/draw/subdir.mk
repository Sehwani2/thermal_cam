################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/lv_draw.c \
../APP/lib/lvgl/src/draw/lv_draw_arc.c \
../APP/lib/lvgl/src/draw/lv_draw_buf.c \
../APP/lib/lvgl/src/draw/lv_draw_image.c \
../APP/lib/lvgl/src/draw/lv_draw_label.c \
../APP/lib/lvgl/src/draw/lv_draw_line.c \
../APP/lib/lvgl/src/draw/lv_draw_mask.c \
../APP/lib/lvgl/src/draw/lv_draw_rect.c \
../APP/lib/lvgl/src/draw/lv_draw_triangle.c \
../APP/lib/lvgl/src/draw/lv_draw_vector.c \
../APP/lib/lvgl/src/draw/lv_image_decoder.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/lv_draw.d \
./APP/lib/lvgl/src/draw/lv_draw_arc.d \
./APP/lib/lvgl/src/draw/lv_draw_buf.d \
./APP/lib/lvgl/src/draw/lv_draw_image.d \
./APP/lib/lvgl/src/draw/lv_draw_label.d \
./APP/lib/lvgl/src/draw/lv_draw_line.d \
./APP/lib/lvgl/src/draw/lv_draw_mask.d \
./APP/lib/lvgl/src/draw/lv_draw_rect.d \
./APP/lib/lvgl/src/draw/lv_draw_triangle.d \
./APP/lib/lvgl/src/draw/lv_draw_vector.d \
./APP/lib/lvgl/src/draw/lv_image_decoder.d 

OBJS += \
./APP/lib/lvgl/src/draw/lv_draw.o \
./APP/lib/lvgl/src/draw/lv_draw_arc.o \
./APP/lib/lvgl/src/draw/lv_draw_buf.o \
./APP/lib/lvgl/src/draw/lv_draw_image.o \
./APP/lib/lvgl/src/draw/lv_draw_label.o \
./APP/lib/lvgl/src/draw/lv_draw_line.o \
./APP/lib/lvgl/src/draw/lv_draw_mask.o \
./APP/lib/lvgl/src/draw/lv_draw_rect.o \
./APP/lib/lvgl/src/draw/lv_draw_triangle.o \
./APP/lib/lvgl/src/draw/lv_draw_vector.o \
./APP/lib/lvgl/src/draw/lv_image_decoder.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/%.o APP/lib/lvgl/src/draw/%.su APP/lib/lvgl/src/draw/%.cyclo: ../APP/lib/lvgl/src/draw/%.c APP/lib/lvgl/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw:
	-$(RM) ./APP/lib/lvgl/src/draw/lv_draw.cyclo ./APP/lib/lvgl/src/draw/lv_draw.d ./APP/lib/lvgl/src/draw/lv_draw.o ./APP/lib/lvgl/src/draw/lv_draw.su ./APP/lib/lvgl/src/draw/lv_draw_arc.cyclo ./APP/lib/lvgl/src/draw/lv_draw_arc.d ./APP/lib/lvgl/src/draw/lv_draw_arc.o ./APP/lib/lvgl/src/draw/lv_draw_arc.su ./APP/lib/lvgl/src/draw/lv_draw_buf.cyclo ./APP/lib/lvgl/src/draw/lv_draw_buf.d ./APP/lib/lvgl/src/draw/lv_draw_buf.o ./APP/lib/lvgl/src/draw/lv_draw_buf.su ./APP/lib/lvgl/src/draw/lv_draw_image.cyclo ./APP/lib/lvgl/src/draw/lv_draw_image.d ./APP/lib/lvgl/src/draw/lv_draw_image.o ./APP/lib/lvgl/src/draw/lv_draw_image.su ./APP/lib/lvgl/src/draw/lv_draw_label.cyclo ./APP/lib/lvgl/src/draw/lv_draw_label.d ./APP/lib/lvgl/src/draw/lv_draw_label.o ./APP/lib/lvgl/src/draw/lv_draw_label.su ./APP/lib/lvgl/src/draw/lv_draw_line.cyclo ./APP/lib/lvgl/src/draw/lv_draw_line.d ./APP/lib/lvgl/src/draw/lv_draw_line.o ./APP/lib/lvgl/src/draw/lv_draw_line.su ./APP/lib/lvgl/src/draw/lv_draw_mask.cyclo ./APP/lib/lvgl/src/draw/lv_draw_mask.d ./APP/lib/lvgl/src/draw/lv_draw_mask.o ./APP/lib/lvgl/src/draw/lv_draw_mask.su ./APP/lib/lvgl/src/draw/lv_draw_rect.cyclo ./APP/lib/lvgl/src/draw/lv_draw_rect.d ./APP/lib/lvgl/src/draw/lv_draw_rect.o ./APP/lib/lvgl/src/draw/lv_draw_rect.su ./APP/lib/lvgl/src/draw/lv_draw_triangle.cyclo ./APP/lib/lvgl/src/draw/lv_draw_triangle.d ./APP/lib/lvgl/src/draw/lv_draw_triangle.o ./APP/lib/lvgl/src/draw/lv_draw_triangle.su ./APP/lib/lvgl/src/draw/lv_draw_vector.cyclo ./APP/lib/lvgl/src/draw/lv_draw_vector.d ./APP/lib/lvgl/src/draw/lv_draw_vector.o ./APP/lib/lvgl/src/draw/lv_draw_vector.su ./APP/lib/lvgl/src/draw/lv_image_decoder.cyclo ./APP/lib/lvgl/src/draw/lv_image_decoder.d ./APP/lib/lvgl/src/draw/lv_image_decoder.o ./APP/lib/lvgl/src/draw/lv_image_decoder.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw

