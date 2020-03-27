
function(add_ardu_lib libname)    
    FILE(GLOB LIB_FUNC_SRC_H     ${ESP32_TOOLCHAIN_PATH}/libraries/${libname}/src/*.h)
    FILE(GLOB LIB_FUNC_SRC_CXX   ${ESP32_TOOLCHAIN_PATH}/libraries/${libname}/src/*.cpp)
    FILE(GLOB LIB_FUNC_SRC_C     ${ESP32_TOOLCHAIN_PATH}/libraries/${libname}/src/*.c)
    #message(">>> Library: ${libname} ${LIB_FUNC_SRC_H} ${LIB_FUNC_SRC_CXX} ${LIB_FUNC_SRC_C} ") 
    add_library(${libname} STATIC  ${LIB_FUNC_SRC_H} ${LIB_FUNC_SRC_CXX} ${LIB_FUNC_SRC_C} )
    include_directories(${LIB_WIFICLI_SRC_CXX}/libraries/${libname}/src)
    get_property(tmp GLOBAL PROPERTY source_list_libs)
    set(tmp ${tmp} ${libname})
    set_property(GLOBAL PROPERTY source_list_libs ${tmp})
endfunction()

function(add_arduino_external_lib libname path_lib)    
    FILE(GLOB LIB_FUNC_SRC_H     ${path_lib}/${libname}/src/*.h)
    FILE(GLOB LIB_FUNC_SRC_CXX   ${path_lib}/${libname}/src/*.cpp)
    FILE(GLOB LIB_FUNC_SRC_C     ${path_lib}/${libname}/src/*.c)
    #message(">>> Library: ${libname} ${LIB_FUNC_SRC_H} ${LIB_FUNC_SRC_CXX} ${LIB_FUNC_SRC_C} ") 
    add_library(${libname} STATIC  ${LIB_FUNC_SRC_H} ${LIB_FUNC_SRC_CXX} ${LIB_FUNC_SRC_C} )
    include_directories(${path_lib}/${libname}/src)
    get_property(tmp GLOBAL PROPERTY source_list_libs)
    set(tmp ${tmp} ${libname})
    set_property(GLOBAL PROPERTY source_list_libs ${tmp})
endfunction()

#FILE(GLOB H_SOURCES_LPUB   PubSubClient/src/*.h)
#FILE(GLOB C_SOURCES_LPUB   PubSubClient/src/*.c)
#FILE(GLOB CXX_SOURCES_LPUB PubSubClient/src/*.cpp)
#add_library(PubSubClient  ${H_SOURCES_LPUB} ${C_SOURCES_LPUB} ${CXX_SOURCES_LPUB} )
#include_directories(PubSubClient/src)

function(add_link_lib targetName) 
    get_property(tmp GLOBAL PROPERTY source_list_libs)
    foreach(X IN LISTS tmp)
      message(STATUS "******************************* LINK ( ${X} ) Library to ${targetName}")
      target_link_libraries (${targetName} "${X}")
    endforeach()
    #
endfunction() 

function(add_arduino_Core_Config project_name_)

    set( ESP_CORE_SRC_FILES
        ${ESP_32_SRC_CORE}/Esp.cpp
        ${ESP_32_SRC_CORE}/FunctionalInterrupt.cpp
        ${ESP_32_SRC_CORE}/HardwareSerial.cpp
        ${ESP_32_SRC_CORE}/IPAddress.cpp
        ${ESP_32_SRC_CORE}/IPv6Address.cpp
        ${ESP_32_SRC_CORE}/MD5Builder.cpp
        ${ESP_32_SRC_CORE}/Print.cpp
        ${ESP_32_SRC_CORE}/Stream.cpp
        ${ESP_32_SRC_CORE}/StreamString.cpp
        ${ESP_32_SRC_CORE}/WMath.cpp
        ${ESP_32_SRC_CORE}/WString.cpp
        ${ESP_32_SRC_CORE}/base64.cpp
        ${ESP_32_SRC_CORE}/cbuf.cpp
        ${ESP_32_SRC_CORE}/main.cpp
        ${ESP_32_SRC_CORE}/esp32-hal-adc.c
        ${ESP_32_SRC_CORE}/esp32-hal-bt.c
        ${ESP_32_SRC_CORE}/esp32-hal-cpu.c
        ${ESP_32_SRC_CORE}/esp32-hal-dac.c
        ${ESP_32_SRC_CORE}/esp32-hal-gpio.c
        ${ESP_32_SRC_CORE}/esp32-hal-i2c.c
        ${ESP_32_SRC_CORE}/esp32-hal-ledc.c
        ${ESP_32_SRC_CORE}/esp32-hal-matrix.c
        ${ESP_32_SRC_CORE}/esp32-hal-misc.c
        ${ESP_32_SRC_CORE}/esp32-hal-psram.c
        ${ESP_32_SRC_CORE}/esp32-hal-rmt.c
        ${ESP_32_SRC_CORE}/esp32-hal-sigmadelta.c
        ${ESP_32_SRC_CORE}/esp32-hal-spi.c
        ${ESP_32_SRC_CORE}/esp32-hal-time.c
        ${ESP_32_SRC_CORE}/esp32-hal-timer.c
        ${ESP_32_SRC_CORE}/esp32-hal-touch.c
        ${ESP_32_SRC_CORE}/esp32-hal-uart.c
        ${ESP_32_SRC_CORE}/stdlib_noniso.c
        ${ESP_32_SRC_CORE}/wiring_pulse.c
        ${ESP_32_SRC_CORE}/wiring_shift.c
        ${ESP_32_SRC_CORE}/libb64/cdecode.c
        ${ESP_32_SRC_CORE}/libb64/cencode.c    
        )
    add_library(CoreLib  ${ESP_CORE_SRC_FILES})
    target_link_libraries (${project_name_}   CoreLib )
endfunction()

function(add_arduino_Core_includes )

    include_directories("${SDK_ESP_INCLUDE}/config")
    include_directories("${SDK_ESP_INCLUDE}/app_trace")
    include_directories("${SDK_ESP_INCLUDE}/app_update")
    include_directories("${SDK_ESP_INCLUDE}/asio")
    include_directories("${SDK_ESP_INCLUDE}/bootloader_support")
    include_directories("${SDK_ESP_INCLUDE}/bt")
    include_directories("${SDK_ESP_INCLUDE}/coap")
    include_directories("${SDK_ESP_INCLUDE}/console")
    include_directories("${SDK_ESP_INCLUDE}/driver")
    include_directories("${SDK_ESP_INCLUDE}/esp-tls")
    include_directories("${SDK_ESP_INCLUDE}/esp32")
    include_directories("${SDK_ESP_INCLUDE}/esp_adc_cal")
    include_directories("${SDK_ESP_INCLUDE}/esp_event")
    include_directories("${SDK_ESP_INCLUDE}/esp_http_client")
    include_directories("${SDK_ESP_INCLUDE}/esp_http_server")
    include_directories("${SDK_ESP_INCLUDE}/esp_https_ota")
    include_directories("${SDK_ESP_INCLUDE}/esp_https_server")
    include_directories("${SDK_ESP_INCLUDE}/esp_ringbuf")
    include_directories("${SDK_ESP_INCLUDE}/ethernet")
    include_directories("${SDK_ESP_INCLUDE}/expat")
    include_directories("${SDK_ESP_INCLUDE}/fatfs")
    include_directories("${SDK_ESP_INCLUDE}/freemodbus")
    include_directories("${SDK_ESP_INCLUDE}/freertos")
    include_directories("${SDK_ESP_INCLUDE}/heap")
    include_directories("${SDK_ESP_INCLUDE}/idf_test")
    include_directories("${SDK_ESP_INCLUDE}/jsmn")
    include_directories("${SDK_ESP_INCLUDE}/json")
    include_directories("${SDK_ESP_INCLUDE}/libsodium")
    include_directories("${SDK_ESP_INCLUDE}/log")
    include_directories("${SDK_ESP_INCLUDE}/lwip")
    include_directories("${SDK_ESP_INCLUDE}/mbedtls")
    include_directories("${SDK_ESP_INCLUDE}/mdns")
    include_directories("${SDK_ESP_INCLUDE}/micro-ecc")
    include_directories("${SDK_ESP_INCLUDE}/mqtt")
    include_directories("${SDK_ESP_INCLUDE}/newlib")
    include_directories("${SDK_ESP_INCLUDE}/nghttp")
    include_directories("${SDK_ESP_INCLUDE}/nvs_flash")
    include_directories("${SDK_ESP_INCLUDE}/openssl")
    include_directories("${SDK_ESP_INCLUDE}/protobuf-c")
    include_directories("${SDK_ESP_INCLUDE}/protocomm")
    include_directories("${SDK_ESP_INCLUDE}/pthread")
    include_directories("${SDK_ESP_INCLUDE}/sdmmc")
    include_directories("${SDK_ESP_INCLUDE}/smartconfig_ack")
    include_directories("${SDK_ESP_INCLUDE}/soc")
    include_directories("${SDK_ESP_INCLUDE}/spi_flash")
    include_directories("${SDK_ESP_INCLUDE}/spiffs")
    include_directories("${SDK_ESP_INCLUDE}/tcp_transport")
    include_directories("${SDK_ESP_INCLUDE}/tcpip_adapter")
    include_directories("${SDK_ESP_INCLUDE}/ulp")
    include_directories("${SDK_ESP_INCLUDE}/unity")
    include_directories("${SDK_ESP_INCLUDE}/vfs")
    include_directories("${SDK_ESP_INCLUDE}/wear_levelling")
    include_directories("${SDK_ESP_INCLUDE}/wifi_provisioning")
    include_directories("${SDK_ESP_INCLUDE}/wpa_supplicant")
    include_directories("${SDK_ESP_INCLUDE}/xtensa-debug-module")
    include_directories("${SDK_ESP_INCLUDE}/esp32-camera")
    include_directories("${SDK_ESP_INCLUDE}/esp-face")
    include_directories("${SDK_ESP_INCLUDE}/fb_gfxinclude_directories")

    include_directories("${ESP32_TOOLCHAIN_PATH}/cores/esp32")
    include_directories("${ESP32_TOOLCHAIN_PATH}/variants/firebeetle32")
    include_directories("${ESP32_TOOLCHAIN_PATH}/libraries/WiFiClientSecure/src")
    include_directories("${ESP32_TOOLCHAIN_PATH}/libraries/WiFi/src")
endfunction() 


function(add_arduino_Core_library project_name_ lib status)

    if(status MATCHES "enable")
      message( ">> ** LIB ..... [ ON  ] Linking ${lib} " )
      target_link_libraries (${project_name_}   ${lib} )
    else()
      message( ">> ** LIB ..... [ OFF ] Linking ${lib} ")
    endif(status MATCHES "enable")

endfunction() 
############################################### COMMANDS AND FLASHING PROCESS #################################################################

function(configure_esptool_function project_name_)
        add_custom_command( TARGET ${project_name_} POST_BUILD
          COMMAND "python"
          ARGS     "${ESP32_TOOLCHAIN_PATH}/tools/gen_esp32part.py" -q "${ESP32_TOOLCHAIN_PATH}/tools/partitions/default.csv" "${project_name_}.partitions.bin"
          COMMENT    "-------- Bin Partition Gen  ----------"
          DEPENDS ${project_name_}.elf 
        )

        add_custom_command( TARGET ${project_name_} POST_BUILD
          COMMAND "${ESP32_TOOLCHAIN_PATH}/tools/esptool/esptool" 
          ARGS  --chip esp32 elf2image --flash_mode "dio" --flash_freq "80m" --flash_size "4MB" -o "${project_name_}.bin" "${project_name_}.elf"
          COMMENT    "-------- ESPTOOL Bin  Gen  ----------"
          DEPENDS ${project_name_}.partitions.bin
        )
endfunction()

function(configure_esptool_flashing project_name_)
    add_custom_target("flash")
    add_custom_command(TARGET "flash" POST_BUILD 
      COMMAND "${ESP32_TOOLCHAIN_PATH}/tools/esptool/esptool" 
      ARGS  --chip esp32 --port ${ESP_FLASH_COMPORT} --baud ${ESP_P_BRATE} --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 ${ESP_BOOT_BIN} 0x1000 ${ESP_BL_BIN} 0x10000 ${project_name_}.bin 0x8000 ${project_name_}.partitions.bin
      COMMENT    "-------- Nada Bin  Gen  ----------"
    )

    add_custom_target("size")
    add_custom_command( TARGET size POST_BUILD
      COMMAND "${CMAKE_BIN_SIZE}"
      ARGS     -A ${project_name_}.elf
      COMMENT    "-------- Get Bin SIZE  ----------"
    )
endfunction() 