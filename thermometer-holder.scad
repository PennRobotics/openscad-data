/*

3.4 + ww + 9.8 = 18.3
  ww = 5.1
*/
$fn=60;

difference() {
  minkowski(){
    hull() {
      translate([0,18.3/2,0]) cylinder(h=7,d=17.3,center=true);
      translate([0,196-18.3/2,0]) cylinder(h=4,d=17.3,center=true);
    }
    sphere(d=1,$fn=24);
  }

  for ( i = [-1 : 2 : 1] ){
    translate([0,18.3/2,i*3.95]) rotate([i*-0.43848,0,0]) union(){
      scale([1.25,1.25,0.30]) sphere(d=10);
      translate([0,22.5-6.25,0]) rotate([90,0,0]) scale([1.25,0.30,45-12.5]) cylinder(h=1,d=10,center=true);
      translate([0,45-12.5,0]) scale([1.25,1.25,0.30]) sphere(d=10);
      translate([-18.6/2, -18.3/2, -1 + i]) cube([18.6, 198, 2]);
    }
  }
  
  hull() {
    translate([3.2,64+4.7/2,0]) cylinder(h=10,d=4.7,center=true);
    translate([3.2,64+97.3-4.7/2,0]) cylinder(h=10,d=4.7,center=true);
  }
  hull() {
    translate([3.2,64+100.3+5.1/2,0]) cylinder(h=10,d=5.1,center=true);
    translate([3.2,196-19.6-5.1/2,0]) cylinder(h=10,d=5.1,center=true);
  }
  
  translate([-4,64+3.8,2.4]) cylinder(h=15,d=5,$fn=3);
  translate([-4,64+60,2.0]) cylinder(h=15,d=5,$fn=3);
  translate([-4,64+91.6,1.7]) cylinder(h=15,d=5,$fn=3);

  /* 114.6 x 3.40 */
  hull(){
    translate([3.2,64+3.4/2-4,0.7]) sphere(d=3.3);
    translate([3.2,64-3.4/2-4+114.6,0]) sphere(d=3.4);
  }
  translate([3.2,64+3.4/2-4,-1.3]) cylinder(h=2,d=1.8,center=true);
}

