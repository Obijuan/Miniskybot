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



class Miniskybot
{


};

#endif // Miniskybot_H
