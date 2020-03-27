
set PATH=%PATH%;C:\Python27

set PATH=%PATH%;C:\Users\Monkey\Documents\00_Projects\04_Git\IOT_ESP\arduino-esp32\tools\xtensa-esp32-elf\bin

set ESP32_TOOLCHAIN_PATH_ENV=C:/Users/Monkey/Documents/00_Projects/04_Git/IOT_ESP/arduino-esp32

mkdir build_win
cd build_win
cmake ../ -G "Unix Makefiles"