//---------------------------------------------------
//-- Auxiliary functions
//---------------------------------------------------
// (c) Juan Gonzalez Gomez (juan@iearobotics.com)
// Credits:
//-- Some files have been taken from the Prusa Mendel:
//   Josef Průša, josefprusa@me.com
//---------------------------------------------------

//----------------------------------
//-- RoundedBox. Parameters:
//--  size = [x,y,z],
//--  r = corner radius
//----------------------------------
module roundedBox(size, r)
{
  hull() {
   cube([size[0]-2*r,size[1]-2*r,size[2]],center=true);

   translate([size[0]/2-r,-size[1]/2+r,0])
   cylinder(r=r,h=size[2],$fn=20,center=true);

   translate([size[0]/2-r,size[1]/2-r,0])
   cylinder(r=r,h=size[2],$fn=20,center=true);

   translate([-size[0]/2+r,-size[1]/2+r,0])
   cylinder(r=r,h=size[2],$fn=20,center=true);

   translate([-size[0]/2+r,size[1]/2-r,0])
   cylinder(r=r,h=size[2],$fn=20,center=true);

  }
}

//------------------------------------------
// A box with only 2 rounded corners. Parameters:
//--  size = [x,y,z],
//--  r = corner radius
//------------------------------------------
module rounded_box_half(size, r) 
{

  hull() {
    translate([r,0,0])
      cube(size = [size[0]-r,size[1],size[2]]);

    translate([r,r,0])
      cylinder(r=r,h=size[2],$fn=20);

    translate([r,size[1]-r,0])
      cylinder(r=r,h=size[2],$fn=20);
  } 
}

//-------------------------------------
//-- Function for the captive nuts
//-------------------------------------
module captive_nut(l=nut_radius)
{
  union() {
    rotate([0,0,30])
    cylinder(r=nut_radius,h=nut_h,$fn=6,center=true);
    translate([-l/2,0,0]) cube([l,2*nut_radius,nut_h],center=true);
  }
}




module nut(d,h,horizontal=true)
{
  cornerdiameter =  (d / 2) / cos (180 / 6);
  cylinder(h = h, r = cornerdiameter, $fn = 6);
  if(horizontal) {
    for(i = [1:6]) {
      rotate([0,0,60*i]) 
        translate([-cornerdiameter-0.2,0,0])
          rotate([0,0,-45])
            cube(size = [2,2,h]);
     }
  }
}

// Based on nophead research
module polyhole(d,h) 
{
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
}

module teardrop(r,h)
{
  $fa=15.0;
  $fs=0.1;

  diameter=2*r;

  linear_extrude(height=h, center=false, convexity=10)
  difference() {
    union() {
      circle(r=diameter/2);
      rotate(45) square(size=diameter/2,center=false);
    }
    translate([-diameter/2,diameter/2]) square(size=diameter);
  }
}

module roundcorner(diameter)
{
  difference() {
    cube(size = [diameter,diameter,99], center = false);
    translate(v = [diameter, diameter, 0]) 
      cylinder(h = 100, r=diameter, center=true);
  }
}


