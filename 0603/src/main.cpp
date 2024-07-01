#include <Arduino.h>

const int ledPin = 3;

void setup() {
    pinMode(ledPin, OUTPUT);    
}

void loop() {
   static bool ledState = LOW;
   digitalWrite(ledPin, ledState = !ledState);

   const int period = 100;
   delay(period);
}
