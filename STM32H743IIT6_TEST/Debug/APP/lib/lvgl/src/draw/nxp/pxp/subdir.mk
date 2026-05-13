################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.c \
../APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.c 

C_DEPS += \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.d \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.d 

OBJS += \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.o \
./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/draw/nxp/pxp/%.o APP/lib/lvgl/src/draw/nxp/pxp/%.su APP/lib/lvgl/src/draw/nxp/pxp/%.cyclo: ../APP/lib/lvgl/src/draw/nxp/pxp/%.c APP/lib/lvgl/src/draw/nxp/pxp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp

clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp:
	-$(RM) ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_buf_pxp.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_fill.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_img.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_layer.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_cfg.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_osa.su ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.cyclo ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.d ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.o ./APP/lib/lvgl/src/draw/nxp/pxp/lv_pxp_utils.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-draw-2f-nxp-2f-pxp

