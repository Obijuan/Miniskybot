//-- Nut
  nut_h = 2.5;
  nut_radius = 6.4/2;
  nut_drill = 3.1;

difference() {
  cylinder(r=nut_radius, h = nut_h, $fn=6,center=true);
  cylinder(r=nut_drill/2, h=10,center=true, $fn=20);
}

