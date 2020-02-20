#include <Servo.h> 
Servo servoLeft; 
Servo servoRight;
double turn=0;
int og=1440;
void setup() {
  pinMode(7, INPUT);
  pinMode(5, INPUT);
  tone(4, 3000, 1000);
  delay(1000); 
  servoLeft.attach(13); 
  servoRight.attach(12);
  Serial.begin(9600);
}

void loop(){
  int wLeft = digitalRead(5);
  int wRight = digitalRead(7);
  if(wLeft == 0){
    if(( og + turn ) > 1300 ){
      turn -= 0.25;
    }
  }
  
  if(wRight == 0){
    if(( og + turn ) < 1500 ){
      turn += 0.25;
    }
  } 
  servoLeft.writeMicroseconds(1700); 
  servoRight.writeMicroseconds(og + turn);

  Serial.println( og + turn);
}
