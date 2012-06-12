#include <Miniskybot.h>

const short BRIDGE_L1 = 2;
const short BRIDGE_R1 = 4; 
const short BRIDGE_E1 = 3;

const short BRIDGE_L2 = 7;
const short BRIDGE_R2 = 6; 
const short BRIDGE_E2 = 5;

Miniskybot miniskybot;

void setup()
{
	//-- Configuring miniskybot: adding hardware
	miniskybyot.addMotor(BRIDGE_L1, BRIDGE_R1, BRIDGE_E1);
	miniskybot.addMotor(BRIDGE_L2, BRIDGE_R2, BRIDGE_E2);

}

void loop()
{

}
