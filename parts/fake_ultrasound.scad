include <configuration.scad>

module fake_ultrasound_srf02()
{

  difference() {

    //-- ultrasound + base board
    union() {

      //-- board
      color("green")
      translate([0,0,ultrasound_base_lz/2])
      cube([ultrasound_base_lx, ultrasound_base_ly, ultrasound_base_lz],center=true);

      //-- Sensor
      color("gray")
      translate([0,0,ultrasound_length/2+ultrasound_base_lz-0.1])
      cylinder(r=ultrasound_hole/2-0.2, h=ultrasound_length,center=true);
    }

    //-- Drill 1
    translate(ultrasound_drill_1)
    cylinder(r=drill_M3/2, h=20,center=true,$fn=8);

    //-- Drill 2
    translate(ultrasound_drill_2)
    cylinder(r=drill_M3/2, h=20,center=true,$fn=8);

    //-- Electrical conections
    for (i=[0:4]) {
      translate([ultrasound_base_lx/2-2, ultrasound_base_ly/2-2-2.5*i,0])
      cylinder(r=0.8, h=20, center=true, $fn=8);  
    }

  }

}

fake_ultrasound_srf02();
