//---------------------------------------------------------
//-- Battery holder for Miniskybot 2. It is based on
//-- the parameterized batery_holder of Miniskybot 1, but
//-- with 4 "ears" for screwing to the chassis
//-- (c) Juan Gonzalez Gomez (Obijuan)
//---------------------------------------------------------
//-- Released under the GPL license
//---------------------------------------------------------
include <configuration.scad>
use <Parameterized_battery_holder.scad>

//-------------------------------
//-- Battery holder ears
//-- Parameters:
//--   do: outer diameter
//--   h : ear height
//-------------------------------
module ear(do, h)
{
  translate([-do/2,do/2,0])
  difference() {
    union() {
      cylinder(r=do/2, h=h,$fn=20);

      translate([do/4,0,h/2])
      cube([do/2,do,h],center=true);
    }
    cylinder(r=drill_M3/2, h=h+10,$fn=8,center=true);
  }
}

//-------------------------------
//--- Battery holder
//-------------------------------
module battery()
{
  union() {

    //-- Main part: a battery holder for 4 AAA batteries
    battery_holder(size=0,num=4);

    //-- Add the 4 ears
    translate([-battery_c1/2,-battery_c2/2,-battery_c3/2])
      ear(do=battery_ear_diam, h=battery_ear_h);

    translate([-battery_c1/2, battery_c2/2-battery_ear_diam,-battery_c3/2])
      ear(do=battery_ear_diam, h=battery_ear_h);

    translate([battery_c1/2, battery_c2/2-battery_ear_diam,-battery_c3/2])
    mirror([1,0,0])
    ear(do=battery_ear_diam,  h=battery_ear_h);

    translate([battery_c1/2, -battery_c2/2,-battery_c3/2])
    mirror([1,0,0])
    ear(do=battery_ear_diam,  h=battery_ear_h);
  }
}

//-- This is for testing/printing the battery holder
projection(cut=true)
translate([0,0,25.5])
rotate([90,0,0])
translate([0,0,battery_c3/2])
battery();


