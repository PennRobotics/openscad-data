DebugCableTrapezoid();

EPS=0.01;
$fn=30;


module _DSubHole(x, z) {
    translate([x, -EPS, z]) rotate([-90, 0, 0]) color("darkgoldenrod", 1.0) cylinder(h=5.5, d=1.02);
}

module _DSub25Outer() {
    hull($fn=60) {
        translate([-38.96/2+2.64, 0, 8.36/2-2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
        translate([38.96/2-2.64, 0, 8.36/2-2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
        translate([38.96/2-2.64-1.01, 0, -8.36/2+2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
        translate([-38.96/2+2.64+1.01, 0, -8.36/2+2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
    }
}

module DSub25Socket() {
    difference() {
        color("#FFFFFF") _DSub25Outer();
        for(xi=[-6.0:6.0])  { _DSubHole(xi*2.77, 2.77/2); }
        for(xi=[-5.5:5.5])  { _DSubHole(xi*2.77, -2.77/2); }
    }
}

module DebugCableTrapezoid() {
    difference() {
        union() {
            color("linen", 1.0) difference() {
                hull() {
                    cube([63, 21, 17]);
                    translate([12.6, -46, 0]) cube([37.8, 25, 11.6]);
                }
                translate([10, 21-EPS-2.3, 2.6]) cube([43, 2.5, 11.8]);
            }
            color("linen", 1.0) translate([12.6, -56, 0]) cube([37.8, 10, 11.6]);
            color("gray") translate([12+19.48, 26, 4.8+4.18]) rotate([0, 0, 180]) translate([0,0.1,0]) minkowski() {sphere(0.02); _DSub25Outer();}
        }
        union() {
            hull() {
                translate([2.1, -0.1+EPS, 1.3]) cube([58.8, 19.8, 14.4]);
                translate([14.7, -46-EPS, 1.3]) cube([33.6, 25, 9.0]);
            }
            translate([14.7, -56-EPS, 1.3]) cube([33.6, 10+2*EPS, 9.0]);
        }
        translate([12+19.48, 26, 4.8+4.18]) rotate([0, 0, 180]) _DSub25Outer();
    }
    color("gray") translate([8, 19, 1.6]) cube([47, 0.8, 13.8]);
    translate([12+19.48, 26, 4.8+4.18]) rotate([0, 0, 180]) DSub25Socket();
}