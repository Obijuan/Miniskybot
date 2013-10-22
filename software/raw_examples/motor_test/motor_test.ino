//---------------------------------------------------------------
//-- Motor test
//--
//--  A simple test of the motors. The robot will move forward,
//--- backward, turn left and turn right
//----------------------------------------------------------------
//-- (c) Juan Gonzalez (Obijuan). Oct - 2013
//-- Released under the GPL v3 license
//----------------------------------------------------------------

#include <Servo.h> 

//-- If using Arduino uno you can comment it out
#include <skymega.h>

//-- Constants for the right motor
const int MOTOR_RIGHT = SERVO2;  //-- If using arduino, write the pin number instead
const int MOTOR_RIGHT_FW = 0;    //-- Move the right motor forward
const int MOTOR_RIGHT_BW = 180;  //-- Move the right motor backward
const int MOTOR_RIGHT_STOP = 90; //-- Stop the right motor

//-- Constants for the left motor
const int MOTOR_LEFT = SERVO4;  //-- If using arduino, write the pin number instead
const int MOTOR_LEFT_FW = 180;  //-- Move the left motor forward
const int MOTOR_LEFT_BW = 0;    //-- Move the right motor backward
const int MOTOR_LEFT_STOP = 90; //-- Stop the left motor
 
//-- The two motors are servos that can turn freely 
Servo rm;  //-- Right motor
Servo lm;  //-- Left motor

//-- Move the robot forward 
void robot_fw()
{
  rm.write(MOTOR_RIGHT_FW);
  lm.write(MOTOR_LEFT_FW);
}

//-- Move the robot backward
void robot_bw()
{
  rm.write(MOTOR_RIGHT_BW);
  lm.write(MOTOR_LEFT_BW);
}

//-- Stop the robot  
void robot_stop()
{
  rm.write(MOTOR_RIGHT_STOP);
  lm.write(MOTOR_LEFT_STOP);
}

//-- Turn right the robot
void robot_right()
{
  lm.write(MOTOR_LEFT_FW);
  rm.write(MOTOR_RIGHT_BW);
}


//-- Turn left the robot
void robot_left()
{
  lm.write(MOTOR_LEFT_BW);
  rm.write(MOTOR_RIGHT_FW);
}
  
  
void setup() 
{ 
  //-- Configure the motors
  rm.attach(MOTOR_RIGHT);
  lm.attach(MOTOR_LEFT);
} 
 
 
void loop() 
{ 
  robot_fw();
  delay(1000);
  
  robot_stop();
  delay(300);
  
  robot_bw();
  delay(1000);
  
  robot_stop();
  delay(300);
  
  robot_right();
  delay(500);
  
  robot_stop();
  delay(300);
  
  robot_left();
  delay(500);
  
  robot_stop();
  delay(500);
} 



