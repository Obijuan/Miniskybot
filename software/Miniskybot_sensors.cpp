//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//-- Miniskybot library
//------------------------------------------------------------------------------
//-- Simplify working and programming a Miniskybot (or similar) robot by using
//-- this library.
//--
//-- This library takes charge of obtaining data of several sensors, such as IR 
//-- sensors or ultrasound sensors.
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

#include "Miniskybot_sensors.h"

//################################################################################
//################################################################################
//-- SensorIR members
//################################################################################
//################################################################################

//-- Constructor
void SensorIR::SensorIR(int pin)
{
	_pin = pin;
	_alpha = _beta = 1;
	_length = _value = 0;
}
	
//-- Constructor (with calibration)
void SensorIR::SensorIR( int pin, float alpha, float beta)
{
	_pin = pin;
	calibrate( alpha, beta);
}


//-- Get the voltage measure from the arduino
float SensorIR::getValue()
{
	//-- Read the analog pin:
	int reading = analogRead(_pin);

	//-- Map the reading:
	float value = 5/1023.0*reading;

	//-- Return the value
	return value;
}


//-- Retuns the distance (cm) to the obstacle
float SensorIR::getLength();
{
	//-- Get the voltage reading:
	float value = getValue();

	//-- Convert the value to distance:
	float length = apha * pow(value/1000, -beta);
	
	//-- Assing this value to the internal variable:
	_length = lenght;

	//-- return the length:
	return length; 
}


//-- Sets alpha and beta parameters of the sensor
void SensorIR::calibrate( float alpha, float beta)
{
	_alpha = alpha;
	_beta = beta;
}

