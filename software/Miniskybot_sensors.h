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

class SensorIR
{
	public:
	
	//-- Constructor
	void SensorIR( int pin);
	void SensorIR( int pin, float alpha, float beta);
	
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
}

class SensorUS
{
	public:
	
	//-- Constructor
	void SensorUS( int pinSignal); //-- For 3-wire US sensors (single trigger/echo)
	void SensorUS( int pinTrigger, int pinEcho);  //-- For 4-wire US sensor

	//-- Setup (only needed for 4-wire type sensor)
	void begin();

	//-- Read distance:
	float getLength();
	
	private:
	bool _type; //-- True for 3-wire, False for 4-wire	
	int _pin[2]; 
	float _length; 
}
#endif // Mini_sensors_h
