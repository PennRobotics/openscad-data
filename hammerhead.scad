HW=80;        // Width of head
HH=80;        // Height
HD=180;       // Depth
HR=5;         // Radius
ODMIN=25;     // Opening diameter, minor
ODMAJ=60;     // Opening diameter, major
EPS=0.1;      // Epsilon (to avoid thin features)
K_SHAPE=1.5;  // Hole shape constant. This is "wrong" but close enough

difference() {
    minkowski() {
        difference() {
            intersection() {
                cube([HW-HR,HD-HR,HH-HR], center=true);
                translate([0,0.5*HD+HR,0]) sphere(r=HD, $fn=144);
            }
            rotate([-15,0,0]) translate([0,HD,HH]) cube([HW+EPS,2*HD,HH], center=true);
            rotate([15,0,0]) translate([0,HD,-HH]) cube([HW+EPS,2*HD,HH], center=true);
        }
        sphere(r = HR,$fn=40);
    }
    hull() {
        translate([0, (ODMAJ/2-ODMIN/2)/K_SHAPE, 0]) scale([1, K_SHAPE, 1]) cylinder(h=HH+HR+EPS, d=ODMIN, center=true);
        translate([0, (ODMIN/2-ODMAJ/2)/K_SHAPE, 0]) scale([1, K_SHAPE, 1]) cylinder(h=HH+HR+EPS, d=ODMIN, center=true);
    }
}
