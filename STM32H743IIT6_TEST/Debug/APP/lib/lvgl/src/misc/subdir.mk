################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/misc/lv_anim.c \
../APP/lib/lvgl/src/misc/lv_anim_timeline.c \
../APP/lib/lvgl/src/misc/lv_area.c \
../APP/lib/lvgl/src/misc/lv_array.c \
../APP/lib/lvgl/src/misc/lv_async.c \
../APP/lib/lvgl/src/misc/lv_bidi.c \
../APP/lib/lvgl/src/misc/lv_color.c \
../APP/lib/lvgl/src/misc/lv_color_op.c \
../APP/lib/lvgl/src/misc/lv_event.c \
../APP/lib/lvgl/src/misc/lv_fs.c \
../APP/lib/lvgl/src/misc/lv_ll.c \
../APP/lib/lvgl/src/misc/lv_log.c \
../APP/lib/lvgl/src/misc/lv_lru.c \
../APP/lib/lvgl/src/misc/lv_math.c \
../APP/lib/lvgl/src/misc/lv_matrix.c \
../APP/lib/lvgl/src/misc/lv_palette.c \
../APP/lib/lvgl/src/misc/lv_profiler_builtin.c \
../APP/lib/lvgl/src/misc/lv_rb.c \
../APP/lib/lvgl/src/misc/lv_style.c \
../APP/lib/lvgl/src/misc/lv_style_gen.c \
../APP/lib/lvgl/src/misc/lv_templ.c \
../APP/lib/lvgl/src/misc/lv_text.c \
../APP/lib/lvgl/src/misc/lv_text_ap.c \
../APP/lib/lvgl/src/misc/lv_timer.c \
../APP/lib/lvgl/src/misc/lv_utils.c 

C_DEPS += \
./APP/lib/lvgl/src/misc/lv_anim.d \
./APP/lib/lvgl/src/misc/lv_anim_timeline.d \
./APP/lib/lvgl/src/misc/lv_area.d \
./APP/lib/lvgl/src/misc/lv_array.d \
./APP/lib/lvgl/src/misc/lv_async.d \
./APP/lib/lvgl/src/misc/lv_bidi.d \
./APP/lib/lvgl/src/misc/lv_color.d \
./APP/lib/lvgl/src/misc/lv_color_op.d \
./APP/lib/lvgl/src/misc/lv_event.d \
./APP/lib/lvgl/src/misc/lv_fs.d \
./APP/lib/lvgl/src/misc/lv_ll.d \
./APP/lib/lvgl/src/misc/lv_log.d \
./APP/lib/lvgl/src/misc/lv_lru.d \
./APP/lib/lvgl/src/misc/lv_math.d \
./APP/lib/lvgl/src/misc/lv_matrix.d \
./APP/lib/lvgl/src/misc/lv_palette.d \
./APP/lib/lvgl/src/misc/lv_profiler_builtin.d \
./APP/lib/lvgl/src/misc/lv_rb.d \
./APP/lib/lvgl/src/misc/lv_style.d \
./APP/lib/lvgl/src/misc/lv_style_gen.d \
./APP/lib/lvgl/src/misc/lv_templ.d \
./APP/lib/lvgl/src/misc/lv_text.d \
./APP/lib/lvgl/src/misc/lv_text_ap.d \
./APP/lib/lvgl/src/misc/lv_timer.d \
./APP/lib/lvgl/src/misc/lv_utils.d 

OBJS += \
./APP/lib/lvgl/src/misc/lv_anim.o \
./APP/lib/lvgl/src/misc/lv_anim_timeline.o \
./APP/lib/lvgl/src/misc/lv_area.o \
./APP/lib/lvgl/src/misc/lv_array.o \
./APP/lib/lvgl/src/misc/lv_async.o \
./APP/lib/lvgl/src/misc/lv_bidi.o \
./APP/lib/lvgl/src/misc/lv_color.o \
./APP/lib/lvgl/src/misc/lv_color_op.o \
./APP/lib/lvgl/src/misc/lv_event.o \
./APP/lib/lvgl/src/misc/lv_fs.o \
./APP/lib/lvgl/src/misc/lv_ll.o \
./APP/lib/lvgl/src/misc/lv_log.o \
./APP/lib/lvgl/src/misc/lv_lru.o \
./APP/lib/lvgl/src/misc/lv_math.o \
./APP/lib/lvgl/src/misc/lv_matrix.o \
./APP/lib/lvgl/src/misc/lv_palette.o \
./APP/lib/lvgl/src/misc/lv_profiler_builtin.o \
./APP/lib/lvgl/src/misc/lv_rb.o \
./APP/lib/lvgl/src/misc/lv_style.o \
./APP/lib/lvgl/src/misc/lv_style_gen.o \
./APP/lib/lvgl/src/misc/lv_templ.o \
./APP/lib/lvgl/src/misc/lv_text.o \
./APP/lib/lvgl/src/misc/lv_text_ap.o \
./APP/lib/lvgl/src/misc/lv_timer.o \
./APP/lib/lvgl/src/misc/lv_utils.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/misc/%.o APP/lib/lvgl/src/misc/%.su APP/lib/lvgl/src/misc/%.cyclo: ../APP/lib/lvgl/src/misc/%.c APP/lib/lvgl/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-misc

clean-APP-2f-lib-2f-lvgl-2f-src-2f-misc:
	-$(RM) ./APP/lib/lvgl/src/misc/lv_anim.cyclo ./APP/lib/lvgl/src/misc/lv_anim.d ./APP/lib/lvgl/src/misc/lv_anim.o ./APP/lib/lvgl/src/misc/lv_anim.su ./APP/lib/lvgl/src/misc/lv_anim_timeline.cyclo ./APP/lib/lvgl/src/misc/lv_anim_timeline.d ./APP/lib/lvgl/src/misc/lv_anim_timeline.o ./APP/lib/lvgl/src/misc/lv_anim_timeline.su ./APP/lib/lvgl/src/misc/lv_area.cyclo ./APP/lib/lvgl/src/misc/lv_area.d ./APP/lib/lvgl/src/misc/lv_area.o ./APP/lib/lvgl/src/misc/lv_area.su ./APP/lib/lvgl/src/misc/lv_array.cyclo ./APP/lib/lvgl/src/misc/lv_array.d ./APP/lib/lvgl/src/misc/lv_array.o ./APP/lib/lvgl/src/misc/lv_array.su ./APP/lib/lvgl/src/misc/lv_async.cyclo ./APP/lib/lvgl/src/misc/lv_async.d ./APP/lib/lvgl/src/misc/lv_async.o ./APP/lib/lvgl/src/misc/lv_async.su ./APP/lib/lvgl/src/misc/lv_bidi.cyclo ./APP/lib/lvgl/src/misc/lv_bidi.d ./APP/lib/lvgl/src/misc/lv_bidi.o ./APP/lib/lvgl/src/misc/lv_bidi.su ./APP/lib/lvgl/src/misc/lv_color.cyclo ./APP/lib/lvgl/src/misc/lv_color.d ./APP/lib/lvgl/src/misc/lv_color.o ./APP/lib/lvgl/src/misc/lv_color.su ./APP/lib/lvgl/src/misc/lv_color_op.cyclo ./APP/lib/lvgl/src/misc/lv_color_op.d ./APP/lib/lvgl/src/misc/lv_color_op.o ./APP/lib/lvgl/src/misc/lv_color_op.su ./APP/lib/lvgl/src/misc/lv_event.cyclo ./APP/lib/lvgl/src/misc/lv_event.d ./APP/lib/lvgl/src/misc/lv_event.o ./APP/lib/lvgl/src/misc/lv_event.su ./APP/lib/lvgl/src/misc/lv_fs.cyclo ./APP/lib/lvgl/src/misc/lv_fs.d ./APP/lib/lvgl/src/misc/lv_fs.o ./APP/lib/lvgl/src/misc/lv_fs.su ./APP/lib/lvgl/src/misc/lv_ll.cyclo ./APP/lib/lvgl/src/misc/lv_ll.d ./APP/lib/lvgl/src/misc/lv_ll.o ./APP/lib/lvgl/src/misc/lv_ll.su ./APP/lib/lvgl/src/misc/lv_log.cyclo ./APP/lib/lvgl/src/misc/lv_log.d ./APP/lib/lvgl/src/misc/lv_log.o ./APP/lib/lvgl/src/misc/lv_log.su ./APP/lib/lvgl/src/misc/lv_lru.cyclo ./APP/lib/lvgl/src/misc/lv_lru.d ./APP/lib/lvgl/src/misc/lv_lru.o ./APP/lib/lvgl/src/misc/lv_lru.su ./APP/lib/lvgl/src/misc/lv_math.cyclo ./APP/lib/lvgl/src/misc/lv_math.d ./APP/lib/lvgl/src/misc/lv_math.o ./APP/lib/lvgl/src/misc/lv_math.su ./APP/lib/lvgl/src/misc/lv_matrix.cyclo ./APP/lib/lvgl/src/misc/lv_matrix.d ./APP/lib/lvgl/src/misc/lv_matrix.o ./APP/lib/lvgl/src/misc/lv_matrix.su ./APP/lib/lvgl/src/misc/lv_palette.cyclo ./APP/lib/lvgl/src/misc/lv_palette.d ./APP/lib/lvgl/src/misc/lv_palette.o ./APP/lib/lvgl/src/misc/lv_palette.su ./APP/lib/lvgl/src/misc/lv_profiler_builtin.cyclo ./APP/lib/lvgl/src/misc/lv_profiler_builtin.d ./APP/lib/lvgl/src/misc/lv_profiler_builtin.o ./APP/lib/lvgl/src/misc/lv_profiler_builtin.su ./APP/lib/lvgl/src/misc/lv_rb.cyclo ./APP/lib/lvgl/src/misc/lv_rb.d ./APP/lib/lvgl/src/misc/lv_rb.o ./APP/lib/lvgl/src/misc/lv_rb.su ./APP/lib/lvgl/src/misc/lv_style.cyclo ./APP/lib/lvgl/src/misc/lv_style.d ./APP/lib/lvgl/src/misc/lv_style.o ./APP/lib/lvgl/src/misc/lv_style.su ./APP/lib/lvgl/src/misc/lv_style_gen.cyclo ./APP/lib/lvgl/src/misc/lv_style_gen.d ./APP/lib/lvgl/src/misc/lv_style_gen.o ./APP/lib/lvgl/src/misc/lv_style_gen.su ./APP/lib/lvgl/src/misc/lv_templ.cyclo ./APP/lib/lvgl/src/misc/lv_templ.d ./APP/lib/lvgl/src/misc/lv_templ.o ./APP/lib/lvgl/src/misc/lv_templ.su ./APP/lib/lvgl/src/misc/lv_text.cyclo ./APP/lib/lvgl/src/misc/lv_text.d ./APP/lib/lvgl/src/misc/lv_text.o ./APP/lib/lvgl/src/misc/lv_text.su ./APP/lib/lvgl/src/misc/lv_text_ap.cyclo ./APP/lib/lvgl/src/misc/lv_text_ap.d ./APP/lib/lvgl/src/misc/lv_text_ap.o ./APP/lib/lvgl/src/misc/lv_text_ap.su ./APP/lib/lvgl/src/misc/lv_timer.cyclo ./APP/lib/lvgl/src/misc/lv_timer.d ./APP/lib/lvgl/src/misc/lv_timer.o ./APP/lib/lvgl/src/misc/lv_timer.su ./APP/lib/lvgl/src/misc/lv_utils.cyclo ./APP/lib/lvgl/src/misc/lv_utils.d ./APP/lib/lvgl/src/misc/lv_utils.o ./APP/lib/lvgl/src/misc/lv_utils.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-misc

