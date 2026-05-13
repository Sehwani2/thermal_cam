################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../APP/lib/lvgl/src/libs/thorvg/tvgAccessor.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgAnimation.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgCanvas.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgCapi.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgCompressor.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgFill.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgInitializer.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLines.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLoader.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgMath.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgPaint.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgPicture.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgRender.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSaver.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgScene.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgShape.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgStr.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwFill.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwImage.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwMath.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwRle.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwShape.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgText.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.cpp \
../APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.cpp 

OBJS += \
./APP/lib/lvgl/src/libs/thorvg/tvgAccessor.o \
./APP/lib/lvgl/src/libs/thorvg/tvgAnimation.o \
./APP/lib/lvgl/src/libs/thorvg/tvgCanvas.o \
./APP/lib/lvgl/src/libs/thorvg/tvgCapi.o \
./APP/lib/lvgl/src/libs/thorvg/tvgCompressor.o \
./APP/lib/lvgl/src/libs/thorvg/tvgFill.o \
./APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.o \
./APP/lib/lvgl/src/libs/thorvg/tvgInitializer.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLines.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLoader.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.o \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.o \
./APP/lib/lvgl/src/libs/thorvg/tvgMath.o \
./APP/lib/lvgl/src/libs/thorvg/tvgPaint.o \
./APP/lib/lvgl/src/libs/thorvg/tvgPicture.o \
./APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.o \
./APP/lib/lvgl/src/libs/thorvg/tvgRender.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSaver.o \
./APP/lib/lvgl/src/libs/thorvg/tvgScene.o \
./APP/lib/lvgl/src/libs/thorvg/tvgShape.o \
./APP/lib/lvgl/src/libs/thorvg/tvgStr.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwFill.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwImage.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwMath.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwRle.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwShape.o \
./APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.o \
./APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.o \
./APP/lib/lvgl/src/libs/thorvg/tvgText.o \
./APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.o \
./APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.o 

CPP_DEPS += \
./APP/lib/lvgl/src/libs/thorvg/tvgAccessor.d \
./APP/lib/lvgl/src/libs/thorvg/tvgAnimation.d \
./APP/lib/lvgl/src/libs/thorvg/tvgCanvas.d \
./APP/lib/lvgl/src/libs/thorvg/tvgCapi.d \
./APP/lib/lvgl/src/libs/thorvg/tvgCompressor.d \
./APP/lib/lvgl/src/libs/thorvg/tvgFill.d \
./APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.d \
./APP/lib/lvgl/src/libs/thorvg/tvgInitializer.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLines.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLoader.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.d \
./APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.d \
./APP/lib/lvgl/src/libs/thorvg/tvgMath.d \
./APP/lib/lvgl/src/libs/thorvg/tvgPaint.d \
./APP/lib/lvgl/src/libs/thorvg/tvgPicture.d \
./APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.d \
./APP/lib/lvgl/src/libs/thorvg/tvgRender.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSaver.d \
./APP/lib/lvgl/src/libs/thorvg/tvgScene.d \
./APP/lib/lvgl/src/libs/thorvg/tvgShape.d \
./APP/lib/lvgl/src/libs/thorvg/tvgStr.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwFill.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwImage.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwMath.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwRle.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwShape.d \
./APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.d \
./APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.d \
./APP/lib/lvgl/src/libs/thorvg/tvgText.d \
./APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.d \
./APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.d 


# Each subdirectory must supply rules for building sources it contributes
APP/lib/lvgl/src/libs/thorvg/%.o APP/lib/lvgl/src/libs/thorvg/%.su APP/lib/lvgl/src/libs/thorvg/%.cyclo: ../APP/lib/lvgl/src/libs/thorvg/%.cpp APP/lib/lvgl/src/libs/thorvg/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m7 -std=gnu++14 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DUSE_HAL_DRIVER -DSTM32H743xx -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/common/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/hw/include" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/lib" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/common" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/cam" -I"C:/stm32/balancing_robot/STM32H743IIT6_TEST/APP/ap/modules/display" -Og -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-APP-2f-lib-2f-lvgl-2f-src-2f-libs-2f-thorvg

clean-APP-2f-lib-2f-lvgl-2f-src-2f-libs-2f-thorvg:
	-$(RM) ./APP/lib/lvgl/src/libs/thorvg/tvgAccessor.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgAccessor.d ./APP/lib/lvgl/src/libs/thorvg/tvgAccessor.o ./APP/lib/lvgl/src/libs/thorvg/tvgAccessor.su ./APP/lib/lvgl/src/libs/thorvg/tvgAnimation.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgAnimation.d ./APP/lib/lvgl/src/libs/thorvg/tvgAnimation.o ./APP/lib/lvgl/src/libs/thorvg/tvgAnimation.su ./APP/lib/lvgl/src/libs/thorvg/tvgCanvas.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgCanvas.d ./APP/lib/lvgl/src/libs/thorvg/tvgCanvas.o ./APP/lib/lvgl/src/libs/thorvg/tvgCanvas.su ./APP/lib/lvgl/src/libs/thorvg/tvgCapi.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgCapi.d ./APP/lib/lvgl/src/libs/thorvg/tvgCapi.o ./APP/lib/lvgl/src/libs/thorvg/tvgCapi.su ./APP/lib/lvgl/src/libs/thorvg/tvgCompressor.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgCompressor.d ./APP/lib/lvgl/src/libs/thorvg/tvgCompressor.o ./APP/lib/lvgl/src/libs/thorvg/tvgCompressor.su ./APP/lib/lvgl/src/libs/thorvg/tvgFill.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgFill.d ./APP/lib/lvgl/src/libs/thorvg/tvgFill.o ./APP/lib/lvgl/src/libs/thorvg/tvgFill.su ./APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.d ./APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.o ./APP/lib/lvgl/src/libs/thorvg/tvgGlCanvas.su ./APP/lib/lvgl/src/libs/thorvg/tvgInitializer.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgInitializer.d ./APP/lib/lvgl/src/libs/thorvg/tvgInitializer.o ./APP/lib/lvgl/src/libs/thorvg/tvgInitializer.su ./APP/lib/lvgl/src/libs/thorvg/tvgLines.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLines.d ./APP/lib/lvgl/src/libs/thorvg/tvgLines.o ./APP/lib/lvgl/src/libs/thorvg/tvgLines.su ./APP/lib/lvgl/src/libs/thorvg/tvgLoader.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLoader.d ./APP/lib/lvgl/src/libs/thorvg/tvgLoader.o ./APP/lib/lvgl/src/libs/thorvg/tvgLoader.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieAnimation.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieBuilder.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieExpressions.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieInterpolator.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieLoader.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieModel.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParser.su ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.d ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.o ./APP/lib/lvgl/src/libs/thorvg/tvgLottieParserHandler.su ./APP/lib/lvgl/src/libs/thorvg/tvgMath.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgMath.d ./APP/lib/lvgl/src/libs/thorvg/tvgMath.o ./APP/lib/lvgl/src/libs/thorvg/tvgMath.su ./APP/lib/lvgl/src/libs/thorvg/tvgPaint.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgPaint.d ./APP/lib/lvgl/src/libs/thorvg/tvgPaint.o ./APP/lib/lvgl/src/libs/thorvg/tvgPaint.su ./APP/lib/lvgl/src/libs/thorvg/tvgPicture.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgPicture.d ./APP/lib/lvgl/src/libs/thorvg/tvgPicture.o ./APP/lib/lvgl/src/libs/thorvg/tvgPicture.su ./APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.d ./APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.o ./APP/lib/lvgl/src/libs/thorvg/tvgRawLoader.su ./APP/lib/lvgl/src/libs/thorvg/tvgRender.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgRender.d ./APP/lib/lvgl/src/libs/thorvg/tvgRender.o ./APP/lib/lvgl/src/libs/thorvg/tvgRender.su ./APP/lib/lvgl/src/libs/thorvg/tvgSaver.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSaver.d ./APP/lib/lvgl/src/libs/thorvg/tvgSaver.o ./APP/lib/lvgl/src/libs/thorvg/tvgSaver.su ./APP/lib/lvgl/src/libs/thorvg/tvgScene.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgScene.d ./APP/lib/lvgl/src/libs/thorvg/tvgScene.o ./APP/lib/lvgl/src/libs/thorvg/tvgScene.su ./APP/lib/lvgl/src/libs/thorvg/tvgShape.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgShape.d ./APP/lib/lvgl/src/libs/thorvg/tvgShape.o ./APP/lib/lvgl/src/libs/thorvg/tvgShape.su ./APP/lib/lvgl/src/libs/thorvg/tvgStr.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgStr.d ./APP/lib/lvgl/src/libs/thorvg/tvgStr.o ./APP/lib/lvgl/src/libs/thorvg/tvgStr.su ./APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.d ./APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.o ./APP/lib/lvgl/src/libs/thorvg/tvgSvgCssStyle.su ./APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.d ./APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.o ./APP/lib/lvgl/src/libs/thorvg/tvgSvgLoader.su ./APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.d ./APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.o ./APP/lib/lvgl/src/libs/thorvg/tvgSvgPath.su ./APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.d ./APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.o ./APP/lib/lvgl/src/libs/thorvg/tvgSvgSceneBuilder.su ./APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.d
	-$(RM) ./APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.o ./APP/lib/lvgl/src/libs/thorvg/tvgSvgUtil.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwCanvas.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwFill.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwFill.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwFill.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwFill.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwImage.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwImage.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwImage.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwImage.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwMath.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwMath.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwMath.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwMath.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwMemPool.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwRaster.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwRenderer.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwRle.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwRle.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwRle.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwRle.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwShape.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwShape.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwShape.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwShape.su ./APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.d ./APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.o ./APP/lib/lvgl/src/libs/thorvg/tvgSwStroke.su ./APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.d ./APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.o ./APP/lib/lvgl/src/libs/thorvg/tvgTaskScheduler.su ./APP/lib/lvgl/src/libs/thorvg/tvgText.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgText.d ./APP/lib/lvgl/src/libs/thorvg/tvgText.o ./APP/lib/lvgl/src/libs/thorvg/tvgText.su ./APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.d ./APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.o ./APP/lib/lvgl/src/libs/thorvg/tvgWgCanvas.su ./APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.cyclo ./APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.d ./APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.o ./APP/lib/lvgl/src/libs/thorvg/tvgXmlParser.su

.PHONY: clean-APP-2f-lib-2f-lvgl-2f-src-2f-libs-2f-thorvg

