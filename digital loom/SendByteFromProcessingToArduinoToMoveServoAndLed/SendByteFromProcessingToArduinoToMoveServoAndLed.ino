/**
   Receive a set of switch values as a binary number and swith servo on
  with Help from Evan Raskob
*/

#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver();

const int numberOfEngines = 8;
uint8_t servo[numberOfEngines] = {0, 1, 2, 3, 4,5,6,7};  //declare servos

const byte SWITCH_ON = 1;  //declare switch pos
const byte SWITCH_OFF = 0;

int switches = 0b00000000;  // the 0b prefix indicates a binary constant, with 8 places

void setup() {
 

  Serial.begin(9600);
  while (!Serial) {delay (1);}  // wait for serial port to connect. Needed for native USB port only
  Serial.println("16 channel Servo test!");
  //init servos
  pwm.begin();
  pwm.setPWMFreq(60);  // Analog servos run at ~60 Hz updates
  //init sevros and put hand in start pos
  for (int k = 0; k < numberOfEngines; k++) {
    pwm.setPWM(servo[k], 0, 250 );     //put servos in up pos to be ready for weaving 
    Serial.println("start in up position");
    delay(1000);
  }

 // turn off built-in LED
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(8, OUTPUT);
  digitalWrite(13, LOW);
  digitalWrite(12, LOW);
  digitalWrite(11, LOW);
  digitalWrite(10, LOW);
  digitalWrite(9, LOW);


}

//
// check if switch bit is on or off
//
bool getSwitch(int switchNumber) {

  return bitRead(switches, switchNumber) == SWITCH_ON;
}



//

//
void loop() {
  while (Serial.available() > 0)
  {
    switches = Serial.read();
    //Serial.println(switches);
  
    if ( getSwitch(0) ) {   // Receive switches value and do turn servos on if 1
      pinMode(13, OUTPUT);
      digitalWrite(13, HIGH);
      pwm.setPWM(servo[0], 0, 600);
    }
    else {
      pinMode(13, OUTPUT);
      digitalWrite(13, LOW);
      pwm.setPWM(servo[0], 0, 250 );

    }

    if ( getSwitch(1) ) {
      pinMode(12, OUTPUT);
      digitalWrite(12, HIGH);
      pwm.setPWM(servo[1], 0, 600);
    }
    else {
      pinMode(12, OUTPUT);
      digitalWrite(12, LOW);
      pwm.setPWM(servo[1], 0, 250 );

    }

    if ( getSwitch(2) ) {
      pinMode(11, OUTPUT);
      digitalWrite(11, HIGH);
       pwm.setPWM(servo[2], 0, 600);
    }
    else {
      pinMode(11, OUTPUT);
      digitalWrite(11, LOW);
  pwm.setPWM(servo[2], 0, 250 );
    }
    if ( getSwitch(3) ) {
      pinMode(10, OUTPUT);
      digitalWrite(10, HIGH);
      pwm.setPWM(servo[3], 0, 600);
    }
    else {
      pinMode(10, OUTPUT);
      digitalWrite(10, LOW);
pwm.setPWM(servo[3], 0, 250 );
    }
    if ( getSwitch(4) ) {
      pinMode(9, OUTPUT);
      digitalWrite(9, HIGH);
      pwm.setPWM(servo[4], 0, 600);
    }
    else {
      pinMode(9, OUTPUT);
      digitalWrite(9, LOW);
pwm.setPWM(servo[4], 0, 250 );
    }

        if ( getSwitch(5) ) {
      pinMode(9, OUTPUT);
      digitalWrite(9, HIGH);
      pwm.setPWM(servo[5], 0, 600);
    }
    else {
      pinMode(9, OUTPUT);
      digitalWrite(9, LOW);
pwm.setPWM(servo[5], 0, 250 );
    }

     if ( getSwitch(6) ) {
      pinMode(10, OUTPUT);
      digitalWrite(10, HIGH);
      pwm.setPWM(servo[6], 0, 600);
    }
    else {
      pinMode(10, OUTPUT);
      digitalWrite(10, LOW);
pwm.setPWM(servo[6], 0, 250 );
    }
    

      if ( getSwitch(7) ) {
      pinMode(11, OUTPUT);
      digitalWrite(11, HIGH);
      pwm.setPWM(servo[7], 0, 600);
    }
    else {
      pinMode(11, OUTPUT);
      digitalWrite(11, LOW);
pwm.setPWM(servo[7], 0, 250 );
    }

    // use this if you're connected to Processing
    Serial.write(switches);
    // or use this if you're testing via the Serial Monitor in Arduino to print switches as binary (on/off): 10000000
    Serial.println(switches, BIN);
  }
}
