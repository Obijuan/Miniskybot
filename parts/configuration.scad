//------------------------------------
//-- Miniskybot 2 configuration file
//------------------------------------

//-- drills
drill_M3 = 3.2;

//-- captive Nuts
nut_h = 2.6;
nut_radius = 6.6/2;

//------------------------------------------------
//-- Servo parameters
//-- See the doc/futaba-doc2.dxf file
//------------------------------------------------
//-- Servo futaba 3003 dimensions
servo_c1 = 20;
servo_c2 = 7.5;
servo_c3 = 26.4;
servo_c4 = 40.3;
servo_c5 = 30.3;
servo_c6 = 10;
servo_c7 = 11.6;
servo_c8 = 4.1;
servo_c9 = 5.2;
servo_c10 = 9.6;

//-------------------------------------------
//-- Battery holder parameters
//-- See the doc/battery_holder.dxf file
//-------------------------------------------
battery_c1 = 49;
battery_c2 = 51.5;
battery_c3 = 12;
battery_ear_diam = 9;
battery_ear_h = 3;
battery_top_gap = 1;  
//-- Real battery height whith batteries inserted
battery_height = battery_c3 + battery_top_gap;

//----------------------------------
//-- Rear part parameters
//-- See the doc/rear-doc.dxf file
//----------------------------------
rear_c1 = servo_c2 + 3;
rear_c2 = servo_c3*2;
rear_c3 = servo_c1 + battery_height -battery_ear_h;
rear_edge_rad = 3;

//-- Ball caster parameters
WallThickness = 2.25; //thickness of the retaining wall
BallSize = 16.4;  //diameter of  your ball bearing.
Airgap = .65;  // Gap between ball and wall  
BallProtrude = .35; //percentage of ball radius sticking out 
WheelDiameter = 56;  //what size wheels you will use.

//-- Wheels parameters
wheels_diam = 56;
wheel_height = 6;
wheel_gap = 1;

//-- ultrasounds
ultrasound_hole = 16.5;
ultrasound_base_lx = 24+1;
ultrasound_base_ly = 20+1;
ultrasound_base_lz = 3;
ultrasound_length = 12.5;
ultrasound_drill_1 = [-9,7,0];
ultrasound_drill_2 = [9,-8,0];




