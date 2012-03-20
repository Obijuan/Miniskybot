use <Parameterized_battery_holder.scad>

battery_c1 = 49;
battery_c2 = 51.5;
battery_c3 = 12;
battery_ear_diam = 9;
battery_ear_h = 3;

module battery()
{

  ear_diam = 9;
  ear_h = 3;

  union() {

    battery_holder(size=0,num=4);

    translate([-battery_c1/2,-battery_c2/2,-battery_c3/2])
      ear(do=battery_ear_diam, drill=3.1, h=battery_ear_h);

    translate([-battery_c1/2, battery_c2/2-battery_ear_diam,-battery_c3/2])
      ear(do=battery_ear_diam, drill=3.1, h=battery_ear_h);

    translate([battery_c1/2, battery_c2/2-battery_ear_diam,-battery_c3/2])
    mirror([1,0,0])
    ear(do=battery_ear_diam, drill=3.1, h=battery_ear_h);

    translate([battery_c1/2, -battery_c2/2,-battery_c3/2])
    mirror([1,0,0])
    ear(do=battery_ear_diam, drill=3.1, h=battery_ear_h);
  }
}

module ear(do=6, drill=3, h=3)
{
  translate([-do/2,do/2,0])
  difference() {
    union() {
      cylinder(r=do/2, h=h,$fn=20);

      translate([do/4,0,h/2])
      cube([do/2,do,h],center=true);
    }
    cylinder(r=drill/2, h=h+10,$fn=20,center=true);
  }
}

*translate([0,0,battery_c3/2])
battery();


