$fn=360;
difference() {
  union() {
    cylinder(2.0,15.88,15.96);
    cylinder(0.5,16.44,16.60);
  }
  translate([0,0,1.3]) cylinder(2.0,13.86,14.1);
  translate([0,0,0.9]) cylinder(1.0,13.86,13.86);
  difference() {
    translate([0,0,-0.1]) cylinder(1.5,12.1,12.2);
    translate([0,16,0]) cube([9.7,9.7,15],center=true);
    translate([0,-16,0]) cube([9.7,9.7,15],center=true);
  }
}