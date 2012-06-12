//-- Configuration.h

//-- Max number of elements:
#define MAX_MOTORS 2
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


//-- Table containing all the pairs (value/velocitý)
#define NUM_VALUES 12
const float VELOCITY_TABLE[NUM_VALUES][2] = {
	{ 14.5/2, 255 },
	{ 12.5/2, 235},
	{ 12.0/2, 215},
	{ 12.0/2, 195},
	{ 11.0/2, 175},
	{ 10.0/2, 155},
	{  9.0/2, 135},
	{  7.0/2, 115},
	{  6.0/2,  95},
	{  4.0/2,  75},
	{  3.0/2,  65},
	{  2.0/2,  55}
};
