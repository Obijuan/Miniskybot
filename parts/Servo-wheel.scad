//-- Futaba 3003 servo rounded horn parameters

rh_diam1 = 8;  //-- Rounded horn small diameter
rh_diam2 = 21; //-- Rounded horn big diameter
rh_height = 6; //-- Rounded horn  total height (including the plate height)
rh_plate_height = 2;  //-- Rounded horn big plate height



//-------------------------------------------------------
//--- Parameters:
//-- or_idiam: O-ring inner diameter
//-- or_diam: O-ring section diameter
//-- h: Height of the wheel
//--
//--  Module for generating a raw wheel, without any drill
//-------------------------------------------------------
module raw_wheel(or_idiam=50, or_diam=3, h=6)
{
   //-- Wheel parameters
   r = or_idiam/2 + or_diam;   //-- Radius

  //-- Temporal points
  l = or_diam*sqrt(2)/2;

  difference() {
    //-- Body of the wheel
    cylinder (r=r, h=h, $fn=100,center=true);

    //--  wheel's inner section
    rotate_extrude($fn=100)
      translate([r-or_diam/2,0,0])
      polygon( [ [0,0],[l,l],[l,-l] ] , [ [0,1,2] ]);
  }
}


//-------------------------------------------------------
//--- Parameters:
//-- or_idiam: O-ring inner diameter
//-- or_diam: O-ring section diameter
//-- h: Height of the wheel
//--
//-- This module creates a raw-wheel with the connections for
//-- a futaba 3003 servo. 
//-------------------------------------------------------
module Servo_wheel(or_idiam=50, or_diam=3, h=6)
{
  difference() {
      raw_wheel(or_idiam=or_idiam, or_diam=or_diam, h=h);

       //-- Inner drill
      cylinder(center=true, h=2*h + 10, r=rh_diam1/2+0.2,$fn=100);

      //-- Carved circle for the Futaba rounded horn
      translate([0,0,-h/2+rh_height-rh_plate_height]) cylinder(r=rh_diam2/2+0.25, h=2*h+10,$fn=100);
  }

}

//-- Test!
*Servo_wheel();




