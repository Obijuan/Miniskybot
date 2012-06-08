//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//-- Miniskybot library
//------------------------------------------------------------------------------
//-- Simplify working and programming a Miniskybot (or similar) robot by using
//-- this library.
//--
//-- This library takes charge of controlling the motors by means of a L293 dual
//-- H-bridge circuit, but extra functions could be added to work with more types
//-- of motors.
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

//-- Making it compatible with Arduino 1.0 and Arduino 22:
//-- (source: http://forums.adafruit.com/viewtopic.php?f=25&t=24563 )

#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif

#include "Miniskybot_motors.h"


void MotorL293::MotorL293( int pinLeft, int pinRight, int pinEnable)
{
	_pinLeft = pinLeft;
	_pinRight = pinRight;
	_pinEnable = pinEnable;

	_speed = 0;
	_forward = true;
}

void MotorL293::begin()
{
	//-- Set the pins as outputs
	pinMode( _pinLeft, OUTPUT);
	pinMode( _pinRight, OUTPUT);
	pinMode( _pinEnable, OUTPUT);

	//-- Put all pins at 0V (motor OFF)
	digitalWrite( _pinLeft, LOW);
	digitalWrite( _pinRight, LOW);
	digitalWrite( _pinEnable, LOW );
}

void MotorL293::setVelocity( int velocity)
{
	//-- Distinguish between forward / backwards movement
	if ( velocity >= 0 )
	{
		//-- Assign new values to variables:
		_speed = velocity;
		_forward = true;
		
		//-- Send the correct signals to the H-bridge:
		digitalWrite( _pinLeft, LOW);
		digitalWrite( _pinRight, HIGH);
	}
	else
	{
		//-- Assign new values to variables:
		_speed = -velocity;
		_forward = false;

		//-- Send the correct signals to the H-bridge:	
		digitalWrite( _pinLeft, HIGH);
		digitalWrite( _pinRight, LOW);
	}

	//-- Set speed:
	analogWrite(  _pinEnable, _speed);
}

void MotorL293::setVelocity( int velocity, bool forward)
{
	//-- Assign new values to variables:
	_speed = abs(velocity);		
	_forward = forward;
	
	
	//-- Send the correct signals to the H-bridge:
	if ( _forward )
	{				
		digitalWrite( _pinLeft, LOW);
		digitalWrite( _pinRight, HIGH);
	}
	else
	{
		digitalWrite( _pinLeft, HIGH);
		digitalWrite( _pinRight, LOW);
	}

	//-- Set speed:
	analogWrite(  _pinEnable, _speed); 
}

int MotorL293::getVelocity()
{
	//-- Set the modulus:
	int velocity = _speed;
	
	//-- Set the sense:
	if ( !_forward) {velocity*=-1;}
	
	return velocity;
}

void MotorL293::emergencyBrake()
{
	//-- Stop the motor
	digitalWrite( _pinEnable, LOW);	
	digitalWrite( _pinLeft, HIGH);
	digitalWrite( _pinRight, HIGH);
}
