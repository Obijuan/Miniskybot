//-- Configuration.h

//-- Distance between wheels
#define DIST_WHEEL 8.5

//-- Max number of elements:
#define MAX_MOTORS 2 //-- Not recommended to change this, as the Miniskybot code has been developed for a 2-wheel robot
#define MAX_SENSORS_US 2
#define MAX_SENSORS_IR 1

//-- Table containing all the alpha and beta parameters pairs for all IR sensors
const float CALIBRATION_PARAM[MAX_SENSORS_IR][2] = {
	{ 1, 1 } //-- Alpha1, Beta1
};

//-- Types of sensors:
#define IR 0 		//-- Infrared sensor 
#define US 1		//-- Ultrasound sensor, generic
#define US_3PIN 1 	//-- Ultrasound sensor, 3 pin
#define US_4PIN 2 	//-- Ultrasound sensor, 4 pin


//-- Table containing all the pairs (velocity/value)
//-- Must be ordered from higher to lower values
#define NUM_VALUES 13
const float VELOCITY_TABLE[NUM_VALUES][2] = {
	{ 14.5, 255 },
	{ 12.5, 235},
	{ 12.0, 215},
	{ 12.0, 195},
	{ 11.0, 175},
	{ 10.0, 155},
	{  9.0, 135},
	{  7.0, 115},
	{  6.0,  95},
	{  4.0,  75},
	{  3.0,  65},
	{  2.0,  55},
	{  0.0,   0}
};
