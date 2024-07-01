#include <Arduino.h>
#include <MsTimer2.h>

const int motorPin = 5;
const int motorVelPin = A0; 

volatile double motorVel = 0.0;
volatile bool motorStatus = false;

void intrruptHandler() {
    motorVel = analogRead(motorVelPin) / 1024.0 * 5.0;

    Serial.print("Input[V]:");
    Serial.println(motorVel);

    if (Serial.read() == '1') {
        motorStatus = !motorStatus;
    }
}

void setup() {
    Serial.begin(115200);   
    pinMode(motorPin, OUTPUT);

    MsTimer2::set(20, intrruptHandler);
    MsTimer2::start();
}

void loop() {
    const double batteryLevel = 4.5;
    const double motorVoltageRef = 1.0;

    if (motorStatus) {
        analogWrite(motorPin, 255 * motorVoltageRef / batteryLevel);
    } else {
        digitalWrite(motorPin, LOW);
    }
}
