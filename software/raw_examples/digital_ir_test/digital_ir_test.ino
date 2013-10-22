//---------------------------------------------------------------
//-- Digital ir test
//--
//--  A simple test for the digital infrarred sensors
//--
//--  Two ir sensors are connected to the skymega/arduino
//--  The readings are sent by the serial port
//--
//--  1 means white
//--  0 menas black
//----------------------------------------------------------------
//-- (c) Juan Gonzalez (Obijuan). Oct - 2013
//-- Released under the GPL v3 license
//----------------------------------------------------------------

#include <Servo.h> 

//-- If using Arduino uno you can comment it out
#include <skymega.h>

//-- Values for reading the sensors
int s1, s2;

void setup() 
{ 
  //-- Configure the serial port
  Serial.begin(9600);
  
  //-- In the miniskybot robot (with the skymega)
  //-- the IR sensores are connected through the A0 and A1 pins
  //-- (located in the expansion port)
  //-- Configure A0 and A1 as digital inputs
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
} 
 
 
void loop() 
{ 
  //-- Read the IR sensors
  s1 = digitalRead(A0);
  s2 = digitalRead(A1);
  
  //-- Print the values
  Serial.print(s1, DEC);
  Serial.print(" ");
  Serial.print(s2, DEC);
  Serial.println();
  
  delay(100);
} 


