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

#ifndef Mini_sensors_h
#define Mini_sensors_h

//-- Making it compatible with Arduino 1.0 and Arduino 22:
//-- (source: http://forums.adafruit.com/viewtopic.php?f=25&t=24563 )

#if defined(ARDUINO) && ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

class SensorIR
{
	public:
	
	//-- Constructor:
	SensorIR();
	
	//-- Setup (attach the servo to the pin)
	void attach( int pin);
	void attach( int pin, float alpha, float beta);
	
	//-- Get the voltage measure from the arduino
	float getValue();

	//-- Retuns the distance (cm) to the obstacle
	float getLength();

	//-- Sets alpha and beta parameters of the sensor
	void calibrate( float alpha, float beta);

	private:
	
	int _pin;
	float _length;
	float _alpha, _beta;
};

class SensorUS
{
	public:
	
	//-- Constructor
	SensorUS();
	
	//-- Attach the sensor to the pins
	void attach( int pinSignal); //-- For 3-wire US sensors (single trigger/echo)
	void attach( int pinTrigger, int pinEcho);  //-- For 4-wire US sensor

	//-- Read distance:
	float getLength();
	
	private:
	bool _type; //-- True for 3-wire, False for 4-wire	
	int _pin[2]; 
	float _length; 
};

#endif // Mini_sensors_h#include <WProgram.h>
