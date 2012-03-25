//-- Futaba 3003 servo rounded horn parameters

rh_diam1 = 8.5;  //-- Rounded horn small diameter
rh_diam2 = 21.5; //-- Rounded horn big diameter
rh_height = 6; //-- Rounded horn  total height (including the plate height)
rh_plate_height = 2;  //-- Rounded horn big plate height

//-- Cross horn parameters
end_diam = 5;
center_diam = 10;
length = 15;


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

module cross_horn_arm(h=5)
{
  translate([0,length-end_diam/2,0])
  hull() {
    cylinder(r=end_diam/2, h=h, center=true, $fn=20);
    translate([0,1-length+end_diam/2,0])
    cube([center_diam,2,h],center=true);
  }
}

module cross_horn_drills(h=5)
{ 
  union() {
    for ( i = [0 : 3] ) {
        rotate([0,0,i*90])
        translate([0,13.3,0])
        cylinder(r=1.5/2, h=h+10,center=true, $fn=6);  
      }
  }
}


module cross_horn(h=5)
{
  union() {
    cube([center_diam+0.2,center_diam+0.2,h],center=true);

    for ( i = [0 : 3] ) {
      rotate( [0,0,i*90])
      translate([0, center_diam/2, 0])
      cross_horn_arm(h);
    }
  }

}


module horn6_arm(h=5)
{
  horn6_arm_length=10;
  horn6_arm_end_diam = 5;
  horn6_arm_center_diam=7.5;

  translate([0,horn6_arm_length-end_diam/2,0])
  hull() {
    cylinder(r=horn6_arm_end_diam/2, h=h, center=true, $fn=20);
    translate([0,-horn6_arm_length+horn6_arm_end_diam/2,0])
    cube([horn6_arm_center_diam,0.1,h],center=true);
  }
}

module horn6(h=5)
{
  union() {
    cylinder(r=15/2,h=h,center=true);

    for ( i = [0 : 5] ) {
      rotate( [0,0,i*60])
      translate([0, 15/2*cos(30), 0])
      horn6_arm(h);
    }
  }
}

module horn6_drills(h=5)
{ 
  union() {
    for ( i = [0 : 5] ) {
        rotate([0,0,i*60])
        translate([0,10.9,0])
        cylinder(r=1.5/2, h=h+10,center=true, $fn=6);  
      }
  }
}

module round_horn_drills(h=5)
{
  union() {
    for ( i = [0 : 3] ) {
        rotate([0,0,i*90])
        translate([0,7.3,0])
        cylinder(r=1.5/2, h=h+10,center=true, $fn=6);  
      }
  }
}


module servo_wheel_cross(or_idiam=50, or_diam=3, h=6)
{
  difference() {
      raw_wheel(or_idiam=or_idiam, or_diam=or_diam, h=h);

       //-- Inner drill
      cylinder(center=true, h=2*h + 10, r=center_diam/2,$fn=20);

      //-- substract the cross servo horn
      translate([0,0,-h/2+4/2+rh_height-3])
      cross_horn(h=4);

      //-- wheel decoration
      *for (i=[0:3]) {
        rotate([0,0,i*90])
        translate([or_idiam/4,or_idiam/4,0])
        rotate([0,0,45+180])
        cylinder(r=6, h=h+10, center=true, $fn=3);
      }
  }
}

module servo_wheel_horn6(or_idiam=50, or_diam=3, h=6)
{
  difference() {
      raw_wheel(or_idiam=or_idiam, or_diam=or_diam, h=h);

       //-- Inner drill
      cylinder(center=true, h=2*h + 10, r=center_diam/2,$fn=20);

      //-- substract the cross servo horn
      translate([0,0,-h/2+4/2+rh_height-3])
      horn6(h=4);
  }
}


*difference() {
  horn6();
  horn6_drills();
}

*difference() {
  servo_wheel_horn6();
  horn6_drills();
}

*difference() {
  servo_wheel_cross();
  cross_horn_drills();
}

*difference() {
  cross_horn(h=4);
  cross_horn_drills();
}

//-- Test!
difference() {
  Servo_wheel();
  round_horn_drills();
}




