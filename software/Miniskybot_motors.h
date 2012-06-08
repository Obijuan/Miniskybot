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

#ifndef Mini_motors_h
#define Mini_motors_h

class MotorL293
{
	public:
	
	//-- Constructor:
	void MotorL293( int pinLeft, int pinRight, int pinEnable);
	
	//-- Setup function:
	void begin();

	//-- Set velocity of a motor ( 0-255 , if > 0 forward, if < 0 backwards)
	void setVelocity( int velocity );
	
	//-- Set velocity of a motor ( 0-255 , true -> forward, false -> backwards)
	void setVelocity( int velocity , bool sense);

	//-- Get the current velocity of the motor (not actual velocity, the assigned one) [-255,255]
	int getVelocity();

	//-- Stop the motor
	void emergencyBrake();


	private:
	uint8 _speed; //-- Speed of the motor (modulus)
	bool _forward; //-- true if forwards, false if backwards
	int _pinLeft, _pintRight, _pinEnable; //-- Stores the pins for H-bridge connection
 
};

#endif //Mini_motors_h
