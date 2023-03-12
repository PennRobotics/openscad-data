$fn=360;
difference() {
  union() {
    linear_extrude(height=88,twist=240) {
      intersection() {
        make_ring_of(r=38.16/2, cnt=6) square([5, 0.8], center=true);
        circle(d=38.96);
      }
    }
    linear_extrude(height=88,twist=-240) {
      intersection() {
        rotate([0, 0, 30]) {
          make_ring_of(r=38.16/2, cnt=6) square([5, 0.8],center=true);
        }
        circle(d=38.96);
      }
    }
    cylinder(h=88, d=38.16);
    cylinder(h=1, d=38.96);
  }
  translate([0,0,1]) cylinder(h=90, d=37.76);
}

module make_ring_of(r, cnt) {
  for (a = [0 : cnt-1]) {
    ang = a * 360 / cnt;
    translate(r * [sin(ang), -cos(ang), 0]) rotate([0, 0, ang]) children();
  }
}
