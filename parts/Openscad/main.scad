//--------------------------------------------------------------------------
// Miniskybot 2.0
// (c) Juan Gonzalez-Gomez, March-2012
// Robotics and Cybernetics group. Universidad Politecnica de Madrid
//--------------------------------------------------------------------------
//-- CREDITS:
//--  The ball caster have been designed by Sliptonic
//   http://www.thingiverse.com/thing:13782
//--------------------------------------------------------------------------
// This code is under the GPL licence
//--------------------------------------------------------------------------

//-- Change the robot parameters in the configuration.scad file
include <configuration.scad>

include <functions.scad>
use <battery_holder.scad>
use <Servo-wheel.scad>
use <fake_ultrasound.scad>


//-----------------------------------------------------------------------
//-- USER PARAMETERS:
//--   Printing mode = true for generating the chassis ready to print
//--   Printing mode = false, for visualizing the Miniskybot robot
//-----------------------------------------------------------------------
printing_mode = true;

//----------------------------------------------------------------
//-- Visualization flagss
//-- These flags only take effect when printing_mode = false
//--  Set them to true or false
//----------------------------------------------------------------
show_servos = true;
show_battery = true;
show_wheels = true;
show_ultrasound = true;


//-----------------------------------------------------------------------
//--    I M P L E M E N T A T I O N      
//-----------------------------------------------------------------------


//-----------------------
//-- Rear part body
//----------------------
module rear_part_body()
{
  difference() {

    //-- Main part
    translate([-rear_c1,0,servo_c1-rear_c3])
    rounded_box_half([rear_c1,rear_c2,rear_c3],r=rear_edge_rad);

    //-- Bottom drills for the battery holder
    translate([-battery_ear_diam/2, (rear_c2-battery_c2)/2+battery_ear_diam/2,
          servo_c1-rear_c3+2])
    cylinder(r=drill_M3/2,h=8, $fn=10);

    translate([-battery_ear_diam/2,
          (rear_c2-battery_c2)/2+battery_ear_diam/2+battery_c2-battery_ear_diam,
          servo_c1-rear_c3+2])
    cylinder(r=drill_M3/2,h=8, $fn=10);

   //-- Bottom drills, part 2. For making the part printable, there cannot be
   //-- one cylinder but two. When assembling the robot, these holes should be
   //-- open manually
   translate([-battery_ear_diam/2, (rear_c2-battery_c2)/2+battery_ear_diam/2,
          servo_c1-rear_c3-1])
    cylinder(r=drill_M3/2,h=2, $fn=10);

    translate([-battery_ear_diam/2,
          (rear_c2-battery_c2)/2+battery_ear_diam/2+battery_c2-battery_ear_diam,
          servo_c1-rear_c3-1])
    cylinder(r=drill_M3/2,h=2, $fn=10);

    //-- Space for the captive nuts
    translate([-battery_ear_diam/2, (rear_c2-battery_c2)/2+battery_ear_diam/2,
          servo_c1-rear_c3+nut_h/2+2])
    rotate([0,0,180])
    captive_nut(10);

    translate([-battery_ear_diam/2,
          (rear_c2-battery_c2)/2+battery_ear_diam/2+battery_c2-battery_ear_diam,
          servo_c1-rear_c3+nut_h/2+2])
    rotate([0,0,180])
    captive_nut(10);

    //-- Drills for the servos
    translate([-servo_c8,-1,servo_c9])
    rotate([-90,0,0])
    cylinder(r=drill_M3/2, h=10, $fn=10);

    translate([-servo_c8,rear_c2-9,servo_c9])
    rotate([-90,0,0])
    cylinder(r=drill_M3/2, h=10, $fn=10);

    //-- Captive nuts for the servo's bolts
    color("green")
    translate([-servo_c8,nut_h/2+2,servo_c9])
    rotate([90,0,0])
    rotate([0,0,180])
    captive_nut(10);  

    color("green")
    translate([-servo_c8,-nut_h/2+rear_c2-2,servo_c9])
    rotate([90,0,0])
    rotate([0,0,180])
    captive_nut(10); 

  }

}

//----------------------
//-- Rear part
//----------------------
module rear_part()
{
  total_height = robot_height;
  cyl_height = total_height;
  cylrad = (BallSize/2) + WallThickness + Airgap;

  ball_caster_height = total_height-(BallSize*BallProtrude);

  difference() {
    union() {
      rear_part_body();
      translate([-cylrad,rear_c2/2,-ball_caster_height +servo_c1+top_plate_thickness])
      cylinder(r=cylrad, h=ball_caster_height);
    }
   translate([-cylrad,rear_c2/2,-cyl_height/2 + (BallSize/2)+top_plate_thickness])
      cube([cylrad/2, cylrad*2+5, BallSize*1.25],center=true);
    
   translate([-cylrad,rear_c2/2,-cyl_height/2 + (BallSize/2)+top_plate_thickness]) 
      sphere (BallSize/2+Airgap, $fa=5, $fs=0.1);

   translate([-rear_c1-8,rear_c2/2,servo_c3+5])
   rotate (a = [0,20,0])
   cube ([20,23,80],center=true);

  }

}


//-------------------
//-- Front part
//-------------------
module front_part()
{
  difference() {
    union() {

      //-- Right "leg". It is smalle than the left. Just for having space
      //-- for the battery wires
      translate([servo_c4,0,4])
      cube([battery_c1-servo_c4,5,servo_c1-4]);

      //-- Left "leg"
      translate([servo_c4,2*servo_c3-5,0])
      cube([battery_c1-servo_c4,5,servo_c1]);

      //-- Front main block
      translate([battery_c1,0,-battery_height+3])
      translate([front_c1, rear_c2, 0])
      rotate([0,0,180])
      rounded_box_half([front_c1, rear_c2, rear_c3],r=rear_edge_rad);
    }
    translate([battery_c1-front_thickness,battery_ear_diam-(battery_c2-rear_c2)/2,
               -rear_c3+servo_c1-5])
    cube([front_c1, battery_c2-2*battery_ear_diam, rear_c3+10]);

    //-- servo drills
    translate([servo_c4+servo_c8,-1,servo_c9+servo_c10])
    rotate([-90,0,0])
    cylinder(r=drill_M3/2, h=2*servo_c3+2, $fn=10);

    //-- Servo Captive nuts
    translate([servo_c4+servo_c8,2,servo_c9+servo_c10])
    rotate([-90,0,0])
    cylinder(r=nut_radius, h=2*servo_c3-4, $fn=6);

    //-- Bottom drills for the battery holder
    translate([battery_c1+battery_ear_diam/2,
              (rear_c2-battery_c2)/2+battery_ear_diam/2,servo_c1-rear_c3-1])
    cylinder(r=drill_M3/2,h=10, $fn=10);

    translate([battery_c1+battery_ear_diam/2,
              (rear_c2-battery_c2)/2+battery_ear_diam/2+battery_c2-battery_ear_diam,
              servo_c1-rear_c3-1])
    cylinder(r=drill_M3/2,h=10, $fn=10);

    //-- Space for the captive nuts
    translate([battery_c1+battery_ear_diam/2,
               (rear_c2-battery_c2)/2+battery_ear_diam/2,
               nut_h/2+servo_c1-rear_c3+2])
    captive_nut(10); 

    translate([battery_c1+battery_ear_diam/2,
               (rear_c2-battery_c2)/2+battery_ear_diam/2+battery_c2-battery_ear_diam,
               nut_h/2+servo_c1-rear_c3+2])
    captive_nut(10); 

    //-- Ultrasound hole
    translate([battery_c1+front_c1,
               rear_c2/2,servo_c1-ultrasound_hole/2-5])
    rotate([0,90,0])
    rotate([0,0,-90])
    translate([0,0,-5])
    teardrop(r=ultrasound_hole/2, h=10);

    //-- Ultrasound drills
    translate([battery_c1+front_c1,
               rear_c2/2 -8,
               servo_c1-ultrasound_hole/2-5-9])
    rotate([0,90,0])
    cylinder(r=drill_M3/2, h=20,center=true, $fn=8);

    translate([battery_c1+front_c1,
               rear_c2/2 +7,
               servo_c1-ultrasound_hole/2-5+9])
    rotate([0,90,0])
    cylinder(r=drill_M3/2, h=20,center=true, $fn=8);

  }

   //-- Bottom drills, part 2. For making the part printable, there cannot be
   //-- one cylinder but two. When assembling the robot, these holes should be
   //-- open manually
   translate([battery_c1+battery_ear_diam/2,
              (rear_c2-battery_c2)/2+battery_ear_diam/2,
              servo_c1-rear_c3+1])
    cylinder(r=drill_M3/2,h=0.4, $fn=10);

   translate([battery_c1+battery_ear_diam/2,
              (rear_c2-battery_c2)/2+battery_ear_diam/2+battery_c2-battery_ear_diam,
              servo_c1-rear_c3+1])
    cylinder(r=drill_M3/2,h=0.4, $fn=10);
    
}


//---------------------------------------------------------
//-- Robot top part. It includes drills for 2 boards:
//--   -skymega
//--   -Arduino UNO
//--------------------------------------------------------
module top_plate_arduino_uno()
{
  trans1 = [(top_plate_c1)/2-rear_c1-nut_radius-1,
             -top_plate_c2/2+nut_radius+1
             ,0];

  trans2 = [(top_plate_c1)/2 - rear_c1,
           rear_c2/2,
           top_plate_thickness/2+servo_c1];

  translate(trans2)
  translate(-trans1)
  difference() {
    translate(trans1)
    difference() {
    
      //-- main plate
      roundedBox([top_plate_c1, top_plate_c2, top_plate_thickness],
                  r=frame_corner_radius);

      //-- First cutout
      translate([-(front_c1+5)/2+(top_plate_c1)/2-front_thickness-2-4,0,0])
      roundedBox([front_c1+5-4, battery_c2-2*battery_ear_diam, rear_c3+10],
               r=frame_corner_radius);

      //-- Skymega drills
      translate([-(top_plate_c1-skymega_lx)/2 + 3,0,0])
      union() {
      translate([skymega_dx, skymega_dy,0])
        cylinder(r=drill_M3/2, h=20, center=true, $fn=20);

      translate([-skymega_dx, skymega_dy,0])
        cylinder(r=drill_M3/2, h=20, center=true, $fn=20);
  
      translate([skymega_dx, -skymega_dy,0])
        cylinder(r=drill_M3/2, h=20, center=true, $fn=20);

      translate([-skymega_dx, -skymega_dy,0])
        cylinder(r=drill_M3/2, h=20, center=true, $fn=20);

        //-- Second cutout
        roundedBox([2*skymega_dx-10, top_plate_c2-20,top_plate_thickness+10],frame_corner_radius,true,$fn=20);
      }

      //-- Captive nuts for the skymega
      translate([-(top_plate_c1-skymega_lx)/2 + 3,0,0])
      union() {
        translate([skymega_dx, skymega_dy,-top_plate_thickness+nut_h])
        cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);

        translate([-skymega_dx, skymega_dy,-top_plate_thickness+nut_h])
        cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);

        translate([skymega_dx, -skymega_dy,-top_plate_thickness+nut_h])
        cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);

        translate([-skymega_dx, -skymega_dy,-top_plate_thickness+nut_h])
        cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);
      }
    }
    //-- Arduino drill 1 (top-left)
    cylinder(r=drill_M3/2, h=top_plate_thickness+10,center=true, $fn=8);

    //-- Captive nut for drill 1
    translate([0, 0,-top_plate_thickness+nut_h])
    cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);

    //-- Arduino drill 2 (bottom-left)
    translate([-1.1,-48.4,0])
    cylinder(r=drill_M3/2, h=top_plate_thickness+10,center=true, $fn=8);

    //-- Captive nut for drill 2
    translate([-1.1,-48.4,-top_plate_thickness+nut_h])
    cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);

    //-- Arduino drill 3 (top-right)
    translate([51,-15.3,0])
    cylinder(r=drill_M3/2, h=top_plate_thickness+10,center=true, $fn=8);

    //-- Captive nut for drill 3
    translate([51,-15.3,-top_plate_thickness+nut_h])
    cylinder(r=nut_radius, h=top_plate_thickness,center=true,$fn=6);

    //-- Arduino drill 4 (bottom-right)
    //translate([51,-43.3,0])
    //cylinder(r=drill_M3/2, h=top_plate_thickness+10,center=true, $fn=8);

  }
    
}


//-------------------------------------
//--  Final Miniskybot frame
//-------------------------------------
module miniskybot_frame()
{
  union() {
    top_plate_arduino_uno();
    front_part();
    rear_part();
  }
}

//-----------------------------------------------------------------
//-- Show the complete robot, acording to the visualization flags
//-----------------------------------------------------------------
module show_robot()
{
  miniskybot_frame();
 
  //-- Servos
  if (show_servos) {
    //-- Right servo
    color([0.2,0.2,0.2])
    translate([servo_c4/2,servo_c3,servo_c1/2])
    rotate([90,0,0])
    import("../futaba3003/futaba.stl");

    //-- Left servo
    color([0.2,0.2,0.2])
    translate([servo_c4/2,servo_c3+0.1,servo_c1/2])
    rotate([-90,0,0])
    import("../futaba3003/futaba.stl");
  }

  //-- Battery holder
  if (show_battery) {
    translate([battery_c1/2,rear_c2/2,-battery_c3/2-battery_top_gap])
    color("blue") battery();
  }

  //-- Wheels  
  if (show_wheels) {
    color("green")
    translate([servo_c5,-servo_c7-wheel_height/2-wheel_gap,servo_c6])
    rotate([90,0,0])
    Servo_wheel_4_arm_horn();

    color("green")
    translate([servo_c5,wheel_height/2+2*servo_c3+servo_c7+wheel_gap,servo_c6])
    rotate([-90,0,0])
    Servo_wheel_4_arm_horn();
  }

  if (show_ultrasound) {
    translate([battery_c1+front_c1-ultrasound_base_lz-front_thickness,
               rear_c2/2,servo_c1-ultrasound_hole/2-5])
    rotate([0,90,0])
    fake_ultrasound_srf02();
  }

}


//--------------------------------------------------
//--    M A I N  
//---------------------------------------------------

//-- Printing mode
if (printing_mode) {
  //-- Rotate and translate the frame so that is is printable
  rotate([0,180,0]) 
  translate([0,0,-servo_c1-top_plate_thickness])
  miniskybot_frame();
}

//--- Show mode
else {
  //projection(cut=true)  //-- robot projection (for dodcumentation pourposes)
  //translate([0,0, 1])
  //rotate([-90,0,0])
  show_robot();
}


