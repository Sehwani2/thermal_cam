################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../APP/lib/lvgl/src/misc/cache/lv_cache.c \
../APP/lib/lvgl/src/misc/cache/lv_cache_entry.c \
../APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.c \
../APP/lib/lvgl/src/misc/cache/lv_image_cache.c \
../APP/lib/lvgl/src/misc/cache/lv_image_header_cache.c 

C_DEPS += \
./APP/lib/lvgl/src/misc/cache/lv_cache.d \
./APP/lib/lvgl/src/misc/cache/lv_cache_entry.d \
./APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.d \
./APP/lib/lvgl/src/misc/cache/lv_image_cache.d \
./APP/lib/lvgl/src/misc/cache/lv_image_header_cache.d 

OBJS += \
./APP/lib/lvgl/src/misc/cache/lv_cache.o \
./APP/lib/lvgl/src/misc/cache/lv_cache_entry.o \
./APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.o \
./APP/lib/lvgl/src/misc/cache/lv_image_cache.o \
./APP/lib/lvgl/src/misc/cache/lv_image_header_cache.o 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/misc/cache/%.o APP/lib/lvgl/src/misc/cache/%.su APP/lib/lvgl/src/misc/cache/%.cyclo: ../APP/lib/lvgl/src/misc/cache/%.c APP/lib/lvgl/src/misc/cache/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-misc-2f-cache

clean-APP-2f-lib-2f-lvgl-2f-src-2f-misc-2f-cache:
	-$(RM) ./APP/lib/lvgl/src/misc/cache/lv_cache.cyclo ./APP/lib/lvgl/src/misc/cache/lv_cache.d ./APP/lib/lvgl/src/misc/cache/lv_cache.o ./APP/lib/lvgl/src/misc/cache/lv_cache.su ./APP/lib/lvgl/src/misc/cache/lv_cache_entry.cyclo ./APP/lib/lvgl/src/misc/cache/lv_cache_entry.d ./APP/lib/lvgl/src/misc/cache/lv_cache_entry.o ./APP/lib/lvgl/src/misc/cache/lv_cache_entry.su ./APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.cyclo ./APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.d ./APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.o ./APP/lib/lvgl/src/misc/cache/lv_cache_lru_rb.su ./APP/lib/lvgl/src/misc/cache/lv_image_cache.cyclo ./APP/lib/lvgl/src/misc/cache/lv_image_cache.d ./APP/lib/lvgl/src/misc/cache/lv_image_cache.o ./APP/lib/lvgl/src/misc/cache/lv_image_cache.su ./APP/lib/lvgl/src/misc/cache/lv_image_header_cache.cyclo ./APP/lib/lvgl/src/misc/cache/lv_image_header_cache.d ./APP/lib/lvgl/src/misc/cache/lv_image_header_cache.o ./APP/lib/lvgl/src/misc/cache/lv_image_header_cache.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-misc-2f-cache

