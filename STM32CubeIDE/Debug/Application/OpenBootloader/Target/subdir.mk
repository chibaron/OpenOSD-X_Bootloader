################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/common_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/flash_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/i2c_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/iwdg_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/optionbytes_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/otp_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/ram_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/systemmemory_interface.c \
C:/USER/openbl/OpenBootloader/OpenBootloader/Target/usart_interface.c 

OBJS += \
./Application/OpenBootloader/Target/common_interface.o \
./Application/OpenBootloader/Target/flash_interface.o \
./Application/OpenBootloader/Target/i2c_interface.o \
./Application/OpenBootloader/Target/iwdg_interface.o \
./Application/OpenBootloader/Target/optionbytes_interface.o \
./Application/OpenBootloader/Target/otp_interface.o \
./Application/OpenBootloader/Target/ram_interface.o \
./Application/OpenBootloader/Target/systemmemory_interface.o \
./Application/OpenBootloader/Target/usart_interface.o 

C_DEPS += \
./Application/OpenBootloader/Target/common_interface.d \
./Application/OpenBootloader/Target/flash_interface.d \
./Application/OpenBootloader/Target/i2c_interface.d \
./Application/OpenBootloader/Target/iwdg_interface.d \
./Application/OpenBootloader/Target/optionbytes_interface.d \
./Application/OpenBootloader/Target/otp_interface.d \
./Application/OpenBootloader/Target/ram_interface.d \
./Application/OpenBootloader/Target/systemmemory_interface.d \
./Application/OpenBootloader/Target/usart_interface.d 


# Each subdirectory must supply rules for building sources it contributes
Application/OpenBootloader/Target/common_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/common_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/flash_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/flash_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/i2c_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/i2c_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/iwdg_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/iwdg_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/optionbytes_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/optionbytes_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/otp_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/otp_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/ram_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/ram_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/systemmemory_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/systemmemory_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/OpenBootloader/Target/usart_interface.o: C:/USER/openbl/OpenBootloader/OpenBootloader/Target/usart_interface.c Application/OpenBootloader/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-OpenBootloader-2f-Target

clean-Application-2f-OpenBootloader-2f-Target:
	-$(RM) ./Application/OpenBootloader/Target/common_interface.cyclo ./Application/OpenBootloader/Target/common_interface.d ./Application/OpenBootloader/Target/common_interface.o ./Application/OpenBootloader/Target/common_interface.su ./Application/OpenBootloader/Target/flash_interface.cyclo ./Application/OpenBootloader/Target/flash_interface.d ./Application/OpenBootloader/Target/flash_interface.o ./Application/OpenBootloader/Target/flash_interface.su ./Application/OpenBootloader/Target/i2c_interface.cyclo ./Application/OpenBootloader/Target/i2c_interface.d ./Application/OpenBootloader/Target/i2c_interface.o ./Application/OpenBootloader/Target/i2c_interface.su ./Application/OpenBootloader/Target/iwdg_interface.cyclo ./Application/OpenBootloader/Target/iwdg_interface.d ./Application/OpenBootloader/Target/iwdg_interface.o ./Application/OpenBootloader/Target/iwdg_interface.su ./Application/OpenBootloader/Target/optionbytes_interface.cyclo ./Application/OpenBootloader/Target/optionbytes_interface.d ./Application/OpenBootloader/Target/optionbytes_interface.o ./Application/OpenBootloader/Target/optionbytes_interface.su ./Application/OpenBootloader/Target/otp_interface.cyclo ./Application/OpenBootloader/Target/otp_interface.d ./Application/OpenBootloader/Target/otp_interface.o ./Application/OpenBootloader/Target/otp_interface.su ./Application/OpenBootloader/Target/ram_interface.cyclo ./Application/OpenBootloader/Target/ram_interface.d ./Application/OpenBootloader/Target/ram_interface.o ./Application/OpenBootloader/Target/ram_interface.su ./Application/OpenBootloader/Target/systemmemory_interface.cyclo ./Application/OpenBootloader/Target/systemmemory_interface.d ./Application/OpenBootloader/Target/systemmemory_interface.o ./Application/OpenBootloader/Target/systemmemory_interface.su ./Application/OpenBootloader/Target/usart_interface.cyclo ./Application/OpenBootloader/Target/usart_interface.d ./Application/OpenBootloader/Target/usart_interface.o ./Application/OpenBootloader/Target/usart_interface.su

.PHONY: clean-Application-2f-OpenBootloader-2f-Target

