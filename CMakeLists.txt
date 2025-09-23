cmake_minimum_required(VERSION 3.22)

set(CMAKE_PROJECT_NAME openosd-x_bootloader)

set(PRJ_VERSION "0.1.0")

option(USE_RTT "Enable SEGGER RTT support" OFF)

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)


# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    message(STATUS "No build type selected, defaulting to Release")
    # Default to Release if no build type is specified
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type")
endif()


# Include toolchain file
include("cmake/gcc-arm-none-eabi.cmake")
if(USE_RTT)
    message(STATUS "RTT enabled")
    include(${CMAKE_CURRENT_LIST_DIR}/cmake/rtt.cmake)
    add_definitions(-DUSE_RTT=1)
else()
    message(STATUS "RTT disabled")
    set(RTT_SOURCES "")
    set(RTT_INCLUDE_DIR "")
    add_definitions(-DUSE_RTT=0)
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

enable_language(C ASM)

# Core project settings
project(${CMAKE_PROJECT_NAME})
message("Build type: " ${CMAKE_BUILD_TYPE})

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# Add HAL stm32g4xx sources
add_subdirectory(cmake/stm32g4xx)

# Link directories setup
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add defined library search paths
)

# Add sources to executable
target_sources(${CMAKE_PROJECT_NAME} PRIVATE
    # Add sources here
	./Src/Core/Src/main.c
	./Src/Core/Src/stm32g4xx_hal_msp.c
	./Src/Core/Src/stm32g4xx_it.c
	./Src/Core/Src/system_stm32g4xx.c
	./Src/Core/Src/led.c
	./Src/OpenBootloader/App/app_openbootloader.c
	./Src/OpenBootloader/App/startup_stm32g431kbtx.s
	./Src/OpenBootloader/Target/common_interface.c
	./Src/OpenBootloader/Target/flash_interface.c
	./Src/OpenBootloader/Target/iwdg_interface.c
	./Src/OpenBootloader/Target/optionbytes_interface.c
	./Src/OpenBootloader/Target/otp_interface.c
	./Src/OpenBootloader/Target/ram_interface.c
	./Src/OpenBootloader/Target/systemmemory_interface.c
	./Src/OpenBootloader/Target/usart_interface.c
	./Src/Middlewares/ST/OpenBootloader/Core/openbl_core.c
	./Src/Middlewares/ST/OpenBootloader/Modules/Mem/openbl_mem.c
	./Src/Middlewares/ST/OpenBootloader/Modules/USART/openbl_usart_cmd.c

)

# Add include paths
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add defined include paths
    ./Src/Core/Inc
	./Src/Middlewares/ST/OpenBootloader/Core
	./Src/Middlewares/ST/OpenBootloader/Modules/I2C
	./Src/Middlewares/ST/OpenBootloader/Modules/Mem
	./Src/Middlewares/ST/OpenBootloader/Modules/USART
	./Src/OpenBootloader/App
	./Src/OpenBootloader/Target

)

# Add project symbols (macros)
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
	USE_FULL_LL_DRIVER
    # Add defined symbols
)

# Add linked libraries
target_link_libraries(${CMAKE_PROJECT_NAME}
    stm32g4xx
    # Add defined libraries
)

# Generate hex and bin files
set(HEX_FILE ${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}_v${PRJ_VERSION}.hex)
set(BIN_FILE ${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}_v${PRJ_VERSION}.bin)



add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${PROJECT_NAME}> ${HEX_FILE}
        COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${PROJECT_NAME}> ${BIN_FILE}
        COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${PROJECT_NAME}>)

