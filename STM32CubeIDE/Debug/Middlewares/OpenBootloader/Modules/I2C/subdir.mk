################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/USER/openbl/OpenBootloader/Middlewares/ST/OpenBootloader/Modules/I2C/openbl_i2c_cmd.c 

OBJS += \
./Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.o 

C_DEPS += \
./Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.o: C:/USER/openbl/OpenBootloader/Middlewares/ST/OpenBootloader/Modules/I2C/openbl_i2c_cmd.c Middlewares/OpenBootloader/Modules/I2C/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32G431xx -DUSE_FULL_LL_DRIVER -DDEBUG -c -I../../Drivers/STM32G4xx_HAL_Driver/Inc -I../../Core/Inc -I../../OpenBootloader/App -I../../OpenBootloader/Target -I../../Middlewares/ST/OpenBootloader/Core -I../../Middlewares/ST/OpenBootloader/Modules/I2C -I../../Middlewares/ST/OpenBootloader/Modules/Mem -I../../Middlewares/ST/OpenBootloader/Modules/USART -I../../Core/Src -I../../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-OpenBootloader-2f-Modules-2f-I2C

clean-Middlewares-2f-OpenBootloader-2f-Modules-2f-I2C:
	-$(RM) ./Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.cyclo ./Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.d ./Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.o ./Middlewares/OpenBootloader/Modules/I2C/openbl_i2c_cmd.su

.PHONY: clean-Middlewares-2f-OpenBootloader-2f-Modules-2f-I2C

