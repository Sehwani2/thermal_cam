################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.cpp \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.cpp 

C_SRCS += \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.c \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.c \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.c \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.c \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.c \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.c \
../APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.c 

C_DEPS += \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.d 

OBJS += \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.o \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.o 

CPP_DEPS += \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.d \
./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.d 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/libs/fsdrv/%.o APP/lib/lvgl/src/libs/fsdrv/%.su APP/lib/lvgl/src/libs/fsdrv/%.cyclo: ../APP/lib/lvgl/src/libs/fsdrv/%.cpp APP/lib/lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m7 -std=gnu++14 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -Og -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
APP/lib/lvgl/src/libs/fsdrv/%.o APP/lib/lvgl/src/libs/fsdrv/%.su APP/lib/lvgl/src/libs/fsdrv/%.cyclo: ../APP/lib/lvgl/src/libs/fsdrv/%.c APP/lib/lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-libs-2f-fsdrv

clean-APP-2f-lib-2f-lvgl-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_esp_littlefs.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_arduino_sd.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_littlefs.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_memfs.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_posix.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.su ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.cyclo ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.d ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.o ./APP/lib/lvgl/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-libs-2f-fsdrv

