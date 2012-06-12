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

