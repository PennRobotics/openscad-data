/*
4.2  h-groove-bottom
6.3  h-groove-top
8.4  h
28.8 OD
25.4 OD-groove

26.20 diameter of cage body (snaps over ring)
26.32 OD ring
25.9 mic-adapt-body (holds ring)
25.7 mic-adapt-upper

3.6  overall mic-adapt-body height
2.2  height to ring center
1.0  ring diameter
*/

$fn=360;
difference() {
  translate([0,0,4.205]) cylinder(h=8.4, d=28.8, center=true);
  translate([0,0,4]) cylinder(h=8, d=25.8, center=true);
  translate([0,0,1.85]) cylinder(h=3.7, d=26.0, center=true);
  translate([0,0,2.2]) minkowski() {
    cylinder(h=0.01,d=25.52,center=true);
    sphere(d=1.03);
  }
  translate([0,0,1.1]) cylinder(h=2.2,d1=26.4,d2=26.16,center=true);
  translate([0,0,1.1]) cylinder(h=2.2,d1=26.2,d2=26.20,center=true);
  cylinder(h=40, d=22.5, center=true);
  translate([0,0,5.25]) rotate([90,0,0]) cylinder(h=80,d=4.5,center=true);
  translate([0,0,5.25]) rotate([0,90,0]) cylinder(h=80,d=4.5,center=true);
  rotate([0,0,36]) cube([40,4.8,0.7]);
}
