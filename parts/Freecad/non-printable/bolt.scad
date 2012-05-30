drill=2;
length=5;
head_thickness=1.5;
head_diameter=4;


union() {
  translate([0,0,-length/2-head_thickness/2])
  cylinder(h=length, r=drill/2,center=true, $fn=20);

  difference() {
    cylinder(h=head_thickness, r=head_diameter/2, $fn=20, center=true);

     translate([0,0,5])
        cube([head_diameter+2, 1,10],center=true);
  }
}
