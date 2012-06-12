//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//-- Miniskybot library
//------------------------------------------------------------------------------
//-- Simplify working and programming a Miniskybot (or similar) robot by using
//-- this library.
//--
//-- It contains functions to control a pair of motors and some sensors. 
//--
//-- For more info, read README
//------------------------------------------------------------------------------
//-- Author:
//-- David Estévez-Fernández, Jun 2012
//-- GPL license
//------------------------------------------------------------------------------
//-- Requires a Miniskybot  robot, design by Juan González-Gómez (Obijuan):
//-- https://github.com/Obijuan/Miniskybot
//------------------------------------------------------------------------------

#ifndef Miniskybot_H
#define Miniskybot_H


#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif

#include "Miniskybot_motors.h"
#include "Miniskybot_sensors.h"
#include "Configuration.h"


class Miniskybot
{
	public:
	
	//-- Constructor
	Miniskybot();
	
	//-- Setup:
	//-----------------------------------------------------
	//-- Add elements
	void addMotor( int pinLeft, int pinRight, int pinEnable );

	void addSensor( int type, int pin);
	void addSensor( int type, int pinTrigger, int pinEcho);

	//-- Movement control:
	//-----------------------------------------------------
	//-- Access individual elements
	void motorControl( int velocity , int index = -1);
	
	//-- Robot control
	void move( float velocity, float angularVelocity);

	//-- Sensor data:
	//----------------------------------------------------
	float getDistance( int type, int sensor );


	private:
	
	//-- Motors
	MotorL293 motor[MAX_MOTORS];
	
	//-- Sensors
	SensorUS sensor_US[MAX_SENSORS_US];
	SensorIR sensor_IR[MAX_SENSORS_IR];

	//-- Counters
	unsigned short _num_motors;
	unsigned short _num_US_sensor;
	unsigned short _num_IR_sensor;

	//-- Current velocities:
	float _velocity, _angularVelocity;	

};


#endif // Miniskybot_H
