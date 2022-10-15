$fn=120;
difference() {

union() {
difference() {
  union() {
    translate([0,0,0.75]) cylinder(h=1.5,d1=27.00,d2=24.00,center=true);
    translate([0,0,-0.16]) cylinder(h=0.32,d=25.00,center=true);
    translate([0,0,-1.07]) cylinder(h=1.5,d=23.95,center=true);
    intersection(){
      rotate([0,0,40]) translate([-12.5,0,0.75]) cube([2,4.4,1.5],center=true);
      translate([0,0,0.75]) cylinder(h=1.5,d1=29.20,d2=23.80,center=true);
    }
  }
  minkowski(){
    sphere(d=0.80,$fn=24);
    translate([0,0,-1.50-0.4]) cylinder(h=5,d=23.95-2*2.4-0.8,center=true);
  }
  translate([0,0,-2.02]) cube([10,20,2], center=true);
  translate([0,-10,-1.5]) rotate([90,0,0]) cylinder(h=10,d=2.2,center=true);
  rotate([0,0,40]) translate([-12.5,0,0.19]) cube([2.4,3.2,0.4], center=true);
}
translate([0,7.5,-0.2]) cube([16,2.4,3.1],center=true);
}

translate([9,-6.3,-3.2]) cylinder(h=4,d=2.0,center=true);
translate([-9,-6.3,-3.2]) cylinder(h=4,d=2.0,center=true);
translate([-8.6,7.6,-3.0]) cylinder(h=4,d=2.2,center=true);
translate([8.6,7.3,-3.0]) cylinder(h=4,d=2.0,center=true);
}