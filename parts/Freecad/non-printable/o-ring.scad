oring_diameter = 15;   //-- Interior diameter
oring_width=3;

rotate_extrude(convexity = 10, $fn=50)
  translate([oring_diameter/2 + oring_width/2, 0, 0])
  circle(r = oring_width/2, $fn = 50);
