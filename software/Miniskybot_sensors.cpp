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


#include "Miniskybot_sensors.h"


//################################################################################
//################################################################################
//-- SensorIR members
//################################################################################
//################################################################################

//-- Constructor
SensorIR:: SensorIR() 
{
	_pin = -1; 
	_length = 0;
	_alpha = _beta = 1;
}

//-- Attach the sensor to a pin
void SensorIR::attach(int pin)	{_pin = pin;}
	
//-- Attach the sensor to a pin (with calibration)
void SensorIR::attach( int pin, float alpha, float beta)
{
	_pin = pin;
	calibrate( alpha, beta);
}


//-- Get the voltage measure from the arduino
float SensorIR::getValue()
{
	//-- If pin not assigned, return -1
	if (_pin != -1)
	{
		//-- Read the analog pin:
		int reading = analogRead(_pin);

		//-- Map the reading:
		float value = 5/1023.0*reading;

		//-- Return the value
		return value;
	}
	else
	{
		return -1;
	}
}


//-- Retuns the distance (cm) to the obstacle
float SensorIR::getLength()
{
	//-- If pin not assigned, return -1
	if (_pin != -1)
	{
		//-- Get the voltage reading:
		float value = getValue();

		//-- Convert the value to distance:
		float length = _alpha * pow(value/1000, -_beta);
	
		//-- Assing this value to the internal variable:
		_length = length;

		//-- return the length:
		return length;
	}
	else
	{
		return -1;
	} 
}


//-- Sets alpha and beta parameters of the sensor
void SensorIR::calibrate( float alpha, float beta)
{
	_alpha = alpha;
	_beta = beta;
}



//################################################################################
//################################################################################
//-- SensorUS members
//################################################################################
//################################################################################

//-- Constructor
SensorUS::SensorUS()	
{ 
	_length = 0; 
	_pin[0] = -1; 
	_pin[1] = -1; 
}

//-- Attach sensor to pin and setup
void SensorUS::attach( int pinSignal) //-- For 3-wire US sensors (single trigger/echo)
{
	_type = true;
	_pin[0] = pinSignal;
	_pin[1] = -1;
}


void SensorUS::attach( int pinTrigger, int pinEcho) //-- For 4-wire US sensor
{
	_type = false;
	_pin[0] = pinTrigger;
	_pin[1] = pinEcho;

	//-- Setup
	pinMode( _pin[0], OUTPUT); //-- Set trigger pin as output
	pinMode( _pin[1], INPUT); //-- Set echo pin as input
}


//-- Read distance:	
float SensorUS::getLength()
{
	//-- If pin not assigned, don't execute anything:
	if ( _pin[0] != -1)
	{
		//-- Different action for different sensors:
		if (_type)
		{
			//---------------------------------------------------------
			//-- This is performed for a 3-wire sensor
			//-- Based on:
			//-- http://www.arduino.cc/en/Tutorial/Ping
			//--------------------------------------------------

			int pin = _pin[0];
		
			//-- Set pin as output:
			pinMode( pin, OUTPUT);
	 
		  	//--Send the pulse:
			digitalWrite( pin, LOW);
			delayMicroseconds(2);
			digitalWrite( pin, HIGH);
			delayMicroseconds(10);
			digitalWrite( pin, LOW);
		
			//-- Set pin as input:
			pinMode( pin, INPUT);
		
			//-- Measure the response pulse:
			unsigned long duration = pulseIn( pin, HIGH);

			//--Calculating the distance:
			unsigned long length = duration / 29 / 2; //--Divide the echo by two, and by speed of sound 
		
			//-- Store the legth:
			_length = length;
		
			//-- Return the distance
			return length;	
		}
		else
		{
			//---------------------------------------------------------
			//-- This is performed for a 4-wire sensor
			//--
			//--
			//-- Based on:
			//-- Library for HC-SR04 Ultrasonic Ranging Module.library
			//-- Created by ITead studio. Apr 20, 2010.
	  		//-- http://www.iteadstudio.com
			//---------------------------------------------------------
		
			//-- Variables created for increased readability:
			int trigger = _pin[0], echo = _pin[1];

			//-- Obtaining the pulse length:

			//--Send the pulse:
			digitalWrite( trigger, LOW);
			delayMicroseconds(2);
			digitalWrite( trigger, HIGH);
			delayMicroseconds(10);
			digitalWrite( trigger, LOW);
		
			//-- Measure the response pulse:
			unsigned long duration = pulseIn( echo, HIGH);


			//--Calculating the distance:
			unsigned long length = duration / 29 / 2; //--Divide the echo by two, and by speed of sound 
		
			//-- Store the legth:
			_length = length;
		
			//-- Return the distance
			return length;		
		}
	}
}
	

