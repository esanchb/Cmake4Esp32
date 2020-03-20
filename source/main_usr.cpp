#include <Arduino.h>
uint64_t chipid;  

void setup();
void loop();
void setup() {
	Serial.begin(115200);
}

void loop() {
	chipid=ESP.getEfuseMac();//The chip ID is essentially its MAC address(length: 6 bytes).
	Serial.printf("Eric ESP32 Chip ID = %04X Jalando Chido !!",(uint16_t)(chipid>>32));//print High 2 bytes
	Serial.printf("%08X\n",(uint32_t)chipid);//print Low 4bytes.

	delay(2000);

}


/*
int main()
{

  return 0;
}
*/