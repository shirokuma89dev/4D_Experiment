#include <Arduino.h>
#include <MsTimer2.h>

class Motor {
   public:
    Motor(int pin, int inputPin) : pin(pin), inputPin(inputPin) {
        pinMode(pin, OUTPUT);
        pinMode(inputPin, INPUT);
    }

    void setVoltage(double voltage) {
        refVel = voltage;
        analogWrite(pin, 255 * refVel / batteryLevel);
    }

    void interruptHandler() {
        realVel = (analogRead(inputPin) * batteryLevel) / 1024.0;
        Serial.print(">realVel:");
        Serial.println(realVel);
        Serial.print(">ref:");
        Serial.println(refVel);
    }

   private:
    const int pin;
    const int inputPin;

    const int batteryLevel = 5;

    double refVel = 1.0;
    volatile double realVel = 0;
};

const int motorPin = 5;
const int motorVelPin = A0;
Motor motor(motorPin, motorVelPin);

void intrruptHandler() {
    motor.interruptHandler();
}

void setup() {
    Serial.begin(9600);

    MsTimer2::set(20, intrruptHandler);
    MsTimer2::start();
}

void loop() {
    motor.setVoltage(0);
    delay(1000);

    motor.setVoltage(0.8);
    delay(4000);

    motor.setVoltage(1.2);
    delay(5000);
}
