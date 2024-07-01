#include <Arduino.h>
#include <MsTimer2.h>

class Motor {
   public:
    const int Period = 20;

    Motor(int pin, int inputPin) : pin(pin), inputPin(inputPin) {
        pinMode(pin, OUTPUT);
        pinMode(inputPin, INPUT);
    }

    void setVoltage(double voltage) {
        analogWrite(pin, 255 * voltage / batteryLevel);
    }

    void interruptHandler() {
        realVel = (analogRead(inputPin) * batteryLevel) / 1024.0;
        
        // 前回の実験より
        const double K = 0.9421910;
        const double T = 0.48;

        // 最大値が5V未満になるように調整
        const double p1 = -4.6;
        const double p2 = -4.6;

        const double Kp = -((p1 + p2) * T + 1) / K;
        const double Ki = p1 * p2 * T / K;

        double error = refVel - realVel;

        integral += error * Ki * Period / 1000;
        command = constrain(Kp * error + integral, 0, 5);

        Serial.print(">realVel:");
        Serial.println(realVel);
        Serial.print(">ref:");
        Serial.println(refVel);
        Serial.print(">command:");
        Serial.println(command);

        setVoltage(command);
    }

    void piControl(double voltage) {
        refVel = voltage;
    }

   private:
    const int pin;
    const int inputPin;

    const int batteryLevel = 5;

    double refVel = 1.0;
    double command = 0;
    volatile double realVel = 0;
    volatile double integral = 0;
};

const int motorPin = 5;
const int motorVelPin = A0;
Motor motor(motorPin, motorVelPin);

void intrruptHandler() {
    motor.interruptHandler();
}

void setup() {
    Serial.begin(115200);

    MsTimer2::set(motor.Period, intrruptHandler);
    MsTimer2::start();
}

void loop() {
    motor.piControl(0);
    delay(1000);

    motor.piControl(0.8);
    delay(4000);

    motor.piControl(1.6);
    delay(5000);
}
