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

#include "Miniskybot.h"

//-- Constructor
Miniskybot::Miniskybot()
{
	_num_motors = 0;
	_num_US_sensor = 0;
	_num_IR_sensor = 0;
	
	_velocity = 0;
	_angularVelocity = 0;
}

	
//-- Setup:
//-----------------------------------------------------
//-- Add elements
void Miniskybot::addMotor( int pinLeft, int pinRight, int pinEnable )
{
	if ( _num_motors < MAX_MOTORS)
	{
		motor[_num_motors].attach( pinLeft, pinRight, pinEnable);
		_num_motors++;
	}
}


void Miniskybot::addSensor( int type, int pin)
{
	if ( type == IR )
	{
		if ( _num_IR_sensor < MAX_SENSORS_IR )
		{
			sensor_IR[_num_IR_sensor].attach( pin, CALIBRATION_PARAM[_num_IR_sensor][0],CALIBRATION_PARAM[_num_IR_sensor][1] );
			_num_IR_sensor++;
		}
	
	}
	else if (type == US_3PIN)
	{
		if ( _num_US_sensor < MAX_SENSORS_US )
		{
			sensor_US[_num_US_sensor].attach( pin);
			_num_US_sensor++;
		}
	}
}


void Miniskybot::addSensor( int type, int pinTrigger, int pinEcho)
{
	if (type == US_4PIN)
	{
		if ( _num_US_sensor < MAX_SENSORS_US )
		{
			sensor_US[_num_US_sensor].attach( pinTrigger, pinEcho);
			_num_US_sensor++;
		}
	}
}


//-- Movement control:
//-----------------------------------------------------
//-- Access individual elements
void Miniskybot::motorControl( int velocity , int index)
{
	if (index == -1 )
	{
		//-- Set velocity in all motors
		for (int i = 0; i < _num_motors; i++)
		{
			motor[i].setVelocity( velocity);
		}
	}
	else
	{	
		//-- Set velocity in just one motor
		if (index < _num_motors)
			motor[index].setVelocity( velocity );
	}
}

//-- Robot control
void Miniskybot::move( float velocity, float angularVelocity)
{
	//-- Control orders and so on
}

//-- Sensor data:
//----------------------------------------------------
float Miniskybot::getDistance( int type, int sensor )
{
	if ( type == IR )
	{
		if ( sensor < _num_IR_sensor )
			return sensor_IR[sensor].getLength();
	}
	else if (type == US || type == US_3PIN || type == US_4PIN)
	{
		if (sensor < _num_US_sensor)
			return sensor_US[sensor].getLength();
	}
}








