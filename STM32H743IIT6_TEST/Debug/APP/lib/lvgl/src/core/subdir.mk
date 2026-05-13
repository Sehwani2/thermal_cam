################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/core/lv_group.c \
../APP/lib/lvgl/src/core/lv_obj.c \
../APP/lib/lvgl/src/core/lv_obj_class.c \
../APP/lib/lvgl/src/core/lv_obj_draw.c \
../APP/lib/lvgl/src/core/lv_obj_event.c \
../APP/lib/lvgl/src/core/lv_obj_id_builtin.c \
../APP/lib/lvgl/src/core/lv_obj_pos.c \
../APP/lib/lvgl/src/core/lv_obj_property.c \
../APP/lib/lvgl/src/core/lv_obj_scroll.c \
../APP/lib/lvgl/src/core/lv_obj_style.c \
../APP/lib/lvgl/src/core/lv_obj_style_gen.c \
../APP/lib/lvgl/src/core/lv_obj_tree.c \
../APP/lib/lvgl/src/core/lv_refr.c 

C_DEPS += \
./APP/lib/lvgl/src/core/lv_group.d \
./APP/lib/lvgl/src/core/lv_obj.d \
./APP/lib/lvgl/src/core/lv_obj_class.d \
./APP/lib/lvgl/src/core/lv_obj_draw.d \
./APP/lib/lvgl/src/core/lv_obj_event.d \
./APP/lib/lvgl/src/core/lv_obj_id_builtin.d \
./APP/lib/lvgl/src/core/lv_obj_pos.d \
./APP/lib/lvgl/src/core/lv_obj_property.d \
./APP/lib/lvgl/src/core/lv_obj_scroll.d \
./APP/lib/lvgl/src/core/lv_obj_style.d \
./APP/lib/lvgl/src/core/lv_obj_style_gen.d \
./APP/lib/lvgl/src/core/lv_obj_tree.d \
./APP/lib/lvgl/src/core/lv_refr.d 

OBJS += \
./APP/lib/lvgl/src/core/lv_group.o \
./APP/lib/lvgl/src/core/lv_obj.o \
./APP/lib/lvgl/src/core/lv_obj_class.o \
./APP/lib/lvgl/src/core/lv_obj_draw.o \
./APP/lib/lvgl/src/core/lv_obj_event.o \
./APP/lib/lvgl/src/core/lv_obj_id_builtin.o \
./APP/lib/lvgl/src/core/lv_obj_pos.o \
./APP/lib/lvgl/src/core/lv_obj_property.o \
./APP/lib/lvgl/src/core/lv_obj_scroll.o \
./APP/lib/lvgl/src/core/lv_obj_style.o \
./APP/lib/lvgl/src/core/lv_obj_style_gen.o \
./APP/lib/lvgl/src/core/lv_obj_tree.o \
./APP/lib/lvgl/src/core/lv_refr.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/core/%.o APP/lib/lvgl/src/core/%.su APP/lib/lvgl/src/core/%.cyclo: ../APP/lib/lvgl/src/core/%.c APP/lib/lvgl/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-core

clean-APP-2f-lib-2f-lvgl-2f-src-2f-core:
	-$(RM) ./APP/lib/lvgl/src/core/lv_group.cyclo ./APP/lib/lvgl/src/core/lv_group.d ./APP/lib/lvgl/src/core/lv_group.o ./APP/lib/lvgl/src/core/lv_group.su ./APP/lib/lvgl/src/core/lv_obj.cyclo ./APP/lib/lvgl/src/core/lv_obj.d ./APP/lib/lvgl/src/core/lv_obj.o ./APP/lib/lvgl/src/core/lv_obj.su ./APP/lib/lvgl/src/core/lv_obj_class.cyclo ./APP/lib/lvgl/src/core/lv_obj_class.d ./APP/lib/lvgl/src/core/lv_obj_class.o ./APP/lib/lvgl/src/core/lv_obj_class.su ./APP/lib/lvgl/src/core/lv_obj_draw.cyclo ./APP/lib/lvgl/src/core/lv_obj_draw.d ./APP/lib/lvgl/src/core/lv_obj_draw.o ./APP/lib/lvgl/src/core/lv_obj_draw.su ./APP/lib/lvgl/src/core/lv_obj_event.cyclo ./APP/lib/lvgl/src/core/lv_obj_event.d ./APP/lib/lvgl/src/core/lv_obj_event.o ./APP/lib/lvgl/src/core/lv_obj_event.su ./APP/lib/lvgl/src/core/lv_obj_id_builtin.cyclo ./APP/lib/lvgl/src/core/lv_obj_id_builtin.d ./APP/lib/lvgl/src/core/lv_obj_id_builtin.o ./APP/lib/lvgl/src/core/lv_obj_id_builtin.su ./APP/lib/lvgl/src/core/lv_obj_pos.cyclo ./APP/lib/lvgl/src/core/lv_obj_pos.d ./APP/lib/lvgl/src/core/lv_obj_pos.o ./APP/lib/lvgl/src/core/lv_obj_pos.su ./APP/lib/lvgl/src/core/lv_obj_property.cyclo ./APP/lib/lvgl/src/core/lv_obj_property.d ./APP/lib/lvgl/src/core/lv_obj_property.o ./APP/lib/lvgl/src/core/lv_obj_property.su ./APP/lib/lvgl/src/core/lv_obj_scroll.cyclo ./APP/lib/lvgl/src/core/lv_obj_scroll.d ./APP/lib/lvgl/src/core/lv_obj_scroll.o ./APP/lib/lvgl/src/core/lv_obj_scroll.su ./APP/lib/lvgl/src/core/lv_obj_style.cyclo ./APP/lib/lvgl/src/core/lv_obj_style.d ./APP/lib/lvgl/src/core/lv_obj_style.o ./APP/lib/lvgl/src/core/lv_obj_style.su ./APP/lib/lvgl/src/core/lv_obj_style_gen.cyclo ./APP/lib/lvgl/src/core/lv_obj_style_gen.d ./APP/lib/lvgl/src/core/lv_obj_style_gen.o ./APP/lib/lvgl/src/core/lv_obj_style_gen.su ./APP/lib/lvgl/src/core/lv_obj_tree.cyclo ./APP/lib/lvgl/src/core/lv_obj_tree.d ./APP/lib/lvgl/src/core/lv_obj_tree.o ./APP/lib/lvgl/src/core/lv_obj_tree.su ./APP/lib/lvgl/src/core/lv_refr.cyclo ./APP/lib/lvgl/src/core/lv_refr.d ./APP/lib/lvgl/src/core/lv_refr.o ./APP/lib/lvgl/src/core/lv_refr.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-core

