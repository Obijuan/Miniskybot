//----------------------------------------------------------
//-- Example of a line follower robot
//--
//-- It is a mixture between the digital_ir_test and motor_test 
//-- examples
//--
//-- The miniskybot will follow the black path, using 
//-- 2 digital ir sensors. When the 2 sensors are reading white,
//-- the robot is stopped.
//--
//-- The algorith is pretty basic. It is summarized in the following table
//--
//--      Left sensor   Right sensor     Action
//--      ----------    ------------    ------------
//--         black         black        move forward
//--         white         black        turn right
//--         black         white        turn left
//--         white         white        stop
//--
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

//-- Right and left IR sensors
int rs,ls;

const int BLACK = 0;
const int WHITE = 1;

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
  //-- Configure IR sensors (digital inputs)
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);

  //-- Configure motors (hacked servos)
  rm.attach(MOTOR_RIGHT);
  lm.attach(MOTOR_LEFT);
}

void loop() 
{
  
  //-- Read the IR sensors
  ls = digitalRead(A0);
  rs = digitalRead(A1);
  
  //-- Move the robot according to the inputs
  if (ls == BLACK && rs == BLACK) 
    robot_fw();
  else if (ls == WHITE && rs == BLACK) 
    robot_right();
  else if (ls == BLACK && rs == WHITE)
    robot_left();
  else 
    robot_stop();
 
}


