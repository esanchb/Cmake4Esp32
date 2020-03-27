#include <Arduino.h>

long lastMsg = 0;


void setup() {
	
  Serial.begin (115200);
  

}

void loop() {
  

  long now = millis();
  if (now - lastMsg > 800) 
  { 
    Serial.print("Publish message: ");   
  }
  
}
