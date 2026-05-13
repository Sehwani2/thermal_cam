################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/osal/lv_cmsis_rtos2.c \
../APP/lib/lvgl/src/osal/lv_freertos.c \
../APP/lib/lvgl/src/osal/lv_mqx.c \
../APP/lib/lvgl/src/osal/lv_os.c \
../APP/lib/lvgl/src/osal/lv_os_none.c \
../APP/lib/lvgl/src/osal/lv_pthread.c \
../APP/lib/lvgl/src/osal/lv_rtthread.c \
../APP/lib/lvgl/src/osal/lv_windows.c 

C_DEPS += \
./APP/lib/lvgl/src/osal/lv_cmsis_rtos2.d \
./APP/lib/lvgl/src/osal/lv_freertos.d \
./APP/lib/lvgl/src/osal/lv_mqx.d \
./APP/lib/lvgl/src/osal/lv_os.d \
./APP/lib/lvgl/src/osal/lv_os_none.d \
./APP/lib/lvgl/src/osal/lv_pthread.d \
./APP/lib/lvgl/src/osal/lv_rtthread.d \
./APP/lib/lvgl/src/osal/lv_windows.d 

OBJS += \
./APP/lib/lvgl/src/osal/lv_cmsis_rtos2.o \
./APP/lib/lvgl/src/osal/lv_freertos.o \
./APP/lib/lvgl/src/osal/lv_mqx.o \
./APP/lib/lvgl/src/osal/lv_os.o \
./APP/lib/lvgl/src/osal/lv_os_none.o \
./APP/lib/lvgl/src/osal/lv_pthread.o \
./APP/lib/lvgl/src/osal/lv_rtthread.o \
./APP/lib/lvgl/src/osal/lv_windows.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/osal/%.o APP/lib/lvgl/src/osal/%.su APP/lib/lvgl/src/osal/%.cyclo: ../APP/lib/lvgl/src/osal/%.c APP/lib/lvgl/src/osal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-osal

clean-APP-2f-lib-2f-lvgl-2f-src-2f-osal:
	-$(RM) ./APP/lib/lvgl/src/osal/lv_cmsis_rtos2.cyclo ./APP/lib/lvgl/src/osal/lv_cmsis_rtos2.d ./APP/lib/lvgl/src/osal/lv_cmsis_rtos2.o ./APP/lib/lvgl/src/osal/lv_cmsis_rtos2.su ./APP/lib/lvgl/src/osal/lv_freertos.cyclo ./APP/lib/lvgl/src/osal/lv_freertos.d ./APP/lib/lvgl/src/osal/lv_freertos.o ./APP/lib/lvgl/src/osal/lv_freertos.su ./APP/lib/lvgl/src/osal/lv_mqx.cyclo ./APP/lib/lvgl/src/osal/lv_mqx.d ./APP/lib/lvgl/src/osal/lv_mqx.o ./APP/lib/lvgl/src/osal/lv_mqx.su ./APP/lib/lvgl/src/osal/lv_os.cyclo ./APP/lib/lvgl/src/osal/lv_os.d ./APP/lib/lvgl/src/osal/lv_os.o ./APP/lib/lvgl/src/osal/lv_os.su ./APP/lib/lvgl/src/osal/lv_os_none.cyclo ./APP/lib/lvgl/src/osal/lv_os_none.d ./APP/lib/lvgl/src/osal/lv_os_none.o ./APP/lib/lvgl/src/osal/lv_os_none.su ./APP/lib/lvgl/src/osal/lv_pthread.cyclo ./APP/lib/lvgl/src/osal/lv_pthread.d ./APP/lib/lvgl/src/osal/lv_pthread.o ./APP/lib/lvgl/src/osal/lv_pthread.su ./APP/lib/lvgl/src/osal/lv_rtthread.cyclo ./APP/lib/lvgl/src/osal/lv_rtthread.d ./APP/lib/lvgl/src/osal/lv_rtthread.o ./APP/lib/lvgl/src/osal/lv_rtthread.su ./APP/lib/lvgl/src/osal/lv_windows.cyclo ./APP/lib/lvgl/src/osal/lv_windows.d ./APP/lib/lvgl/src/osal/lv_windows.o ./APP/lib/lvgl/src/osal/lv_windows.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-osal

