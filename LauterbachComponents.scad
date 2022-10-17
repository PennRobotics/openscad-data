BarrelJack();  // TODO-inprogress

$fn=36;
EPS=0.01;

// TODO: remove following variables/offsets
po1=-4.7;
po2=1;
po3=-5.8;
po4=1.3;

module TriggerTerminal() {
    Width=6.5;
    Height=9.0;
    Depth=12.0;
    HeightHole=5.8;
    DepthHole=10.0;
    DiamHole=5.4;
    DepthPin=8.0;
    DiamPin=1.3;
    translate([Width/2, 0, 0]) union() {
        difference() {
            translate([-Width/2, EPS, 0]) color("black", 1.0) cube([Width, Depth, Height]);
            translate([0, 0, HeightHole]) rotate([-90, 0, 0]) color("dimgray", 1.0) cylinder(h=DepthHole, d=DiamHole, center=false);
        }
        translate([0, DepthHole, HeightHole]) rotate([90, 0, 0]) color("silver", 1.0) cylinder(h=DepthPin, d=DiamPin, center=false);
    }
}

module EthPort() {
    Width1=16.3; Depth1=15.6; Height1=13.1;  // Metal housing
    Width2=14.3; Depth2=15.0; Height2=11.1;  // Composite
    O2=1.0;  // Ethernet Plug Opening Offset
    EW1=11.9; ED1=10.0; EH1=6.9;  // Ethernet Plug Bottom
    EW2=6.4;  ED2=6.0;  EH2=1.7;  // Ethernet Plug Top
    EW3=4.1;  ED3=5.0;  EH3=1.3;  // Ethernet Plug Clip
    LEDW=1.5; LEDH=2.3;  // LED
    LEDOX=5; LEDOH=8.5;  // Offsets

    O1=(Height1-Height2)/2;  // Generated Offset
    translate([Width1/2, 0, 0]) union() {
        difference() {
            union() {
                translate([-Width1/2, 2*EPS, 0]) color("silver", 1.0) cube([Width1, Depth1, Height1]);
                translate([-Width2/2, EPS, O1]) color("#202423") cube([Width2, Depth2, Height2]);
            }
            translate([-EW1/2, 0, O1+O2]) color("dimgray", 1.0) cube([EW1, ED1, EH1+EPS]);
            translate([-EW2/2, 0, O1+O2+EH1]) color("dimgray", 1.0) cube([EW2, ED2, EH2+EPS]);
            translate([-EW3/2, 0, O1+O2+EH1+EH2]) color("dimgray", 1.0) cube([EW3, ED3, EH3]);
        }
        translate([-LEDOX, 0.7, O1+O2+LEDOH]) color("darkgoldenrod", 1.0) cube([LEDW,1.5,LEDH], $fn=30, center=true);
        translate([+LEDOX, 0.7, O1+O2+LEDOH]) color("green", 1.0) cube([LEDW,1.5,LEDH], center=true);
    }
}

module BarrelJack() {
    // TODO: borrow from TriggerTerminal()
    union() {
        difference() {
            translate([-9.2/2, EPS, -12/2]) color("black", 1.0) cube([9.2, 12, 12]);
            translate([0, 0, po2]) rotate([-90, 0, 0]) color("dimgray", 1.0) cylinder(h=10, d=5.5, center=false);
        }
        translate([0, 10, po2]) rotate([90, 0, 0]) color("silver", 1.0) cylinder(h=8, d=2.1, center=false);
        translate([0, 9.5, po2]) rotate([90, 0, 0]) color("silver", 1.0) cylinder(h=1, d=3, center=false);
    }
}

module USB30TypeBPinPair() {
    // TODO: define dims
    // TODO: align with center axis
    color("goldenrod") translate([-1.25, 2, po3+5.13]) rotate([90, 0, 90]) linear_extrude(height = 0.65, center=true) {
        polygon([[0,-0.05],[0,0],[0.8,0],[1.0,0.05],[1.4,0.30],[1.7,0.38],[2.3,0.38],[2.8,0.32],[4.5,0.05],[6,0.0],[6,-0.05],[1,-0.05]]);
    }
    color("goldenrod") translate([-1.25, 2, po3+1.95]) rotate([-90, 0, 90]) linear_extrude(height = 0.65, center=true) {
        polygon([[0,-0.05],[0,0],[0.8,0],[1.0,0.05],[1.4,0.30],[1.7,0.38],[2.3,0.38],[2.8,0.32],[4.5,0.05],[6,0.0],[6,-0.05],[1,-0.05]]);
    }
}

module USB30TypeB() {
    // TODO: define dims
    // TODO: align with center axis
    union() {
        difference() {
            translate([-12.4/2, 2*EPS, -14.1/2]) color("silver", 1.0) cube([12.4, 18.4, 14.1]);
            color("royalblue") hull() {
                translate([-8.45/2, 0, po3]) cube([8.45, 9.00, 6.31+EPS]);
                translate([-6.59/2, 0, po3+6.31]) cube([6.59, 9.00, 0.93+EPS]);
            }
            color("royalblue") translate([-6.59/2, 0, po3+7.24]) cube([6.59, 9.00, 3.56]);
        }
        color("royalblue") hull() {
            translate([-4.6/2, 0.62, po3+2.45]) cube([4.6, 8.38, 2.18+EPS]);
            translate([-5.6/2, 1.68, po3+1.95]) cube([5.6, 7.38, 3.18+EPS]);
        }
        color("royalblue") minkowski() {
            sphere(d=0.6, $fn=6);
            translate([-5.0/2, 1.30, po3+8.64]) cube([5.0, 8.00, 1.01]);
        }
        USB30TypeBPinPair();
        mirror([1, 0, 0]) USB30TypeBPinPair();
    }
}

module _DSubPin(x, z) {
    color("gold", 1.0) hull() {
        translate([x, 0.2, z]) rotate([-90, 0, 0]) cylinder(h=5.5, d=0.64);
        translate([x, 0.2, z]) rotate([-90, 0, 0]) cylinder(h=5.0, d=1);
    }
}

module _DSubHole(x, z) {
    translate([x, -EPS, z]) rotate([-90, 0, 0]) color("gold", 1.0) cylinder(h=5.5, d=1.02);
}

module _DSub25Outer() {
    hull($fn=60) {
        translate([-38.96/2+2.64, 0, 8.36/2-2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
        translate([38.96/2-2.64, 0, 8.36/2-2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
        translate([38.96/2-2.64-1.01, 0, -8.36/2+2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
        translate([-38.96/2+2.64+1.01, 0, -8.36/2+2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=2.64);
    }
}

module _DSub25Inner() {
    hull($fn=60) {
        translate([-38.96/2+2.64, EPS, 8.36/2-2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=1.96);
        translate([38.96/2-2.64, EPS, 8.36/2-2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=1.96);
        translate([38.96/2-2.64-1.01, EPS, -8.36/2+2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=1.96);
        translate([-38.96/2+2.64+1.01, EPS, -8.36/2+2.64]) rotate([-90, 0, 0]) cylinder(h=5.9, r=1.96);
    }
}

module DSub25Pins() {
    // TODO: define dims
    // TODO: align with center axis
    difference() {
        color("silver", 1.0) _DSub25Outer();
        color("white", 1.0) _DSub25Inner();
    }
    for(xi=[-6.0:6.0])  { _DSubPin(xi*2.77, 2.77/2); }
    for(xi=[-5.5:5.5])  { _DSubPin(xi*2.77, -2.77/2); }
}

module DSub25Socket() {
    // TODO: define dims
    // TODO: align with center axis
    difference() {
        color("white", 1.0) _DSub25Outer();
        for(xi=[-6.0:6.0])  { _DSubHole(xi*2.77, 2.77/2); }
        for(xi=[-5.5:5.5])  { _DSubHole(xi*2.77, -2.77/2); }
    }
}

module PowerDebugBlock() {
    // TODO: define dims
    // TODO: align with center axis
    difference() {
        m=1.2;  // Housing fillet diameter
        color("linen", 1.0) translate([m/2, m/2, m/2]) minkowski() {
            sphere(d=m, $fn=18);
            cube([176.5-m, 78.4-m, 21.3-m]);
        }
        color("linen", 1.0) {
            translate([3, 3, 0]) cube([176.5-2*3, 78.4-2*3, 0.4]);
            translate([3, 3, 21.3-0.4]) cube([176.5-2*3, 78.4-2*3, 0.4]);
        }
        color("#425232") translate([3, 3, 2]) cube([170.5, 72.4, 17.3]);
        translate([78.2, 39.22, 19.2]) cylinder(h=2.2, d=39.5);
    }
}

module HeatSink() {
    // TODO: define dims
    // TODO: align with center axis
    color("#202423") difference() {
        hull() {
            cube([76.2, 51.84, 4.4]);
            translate([3,0,0]) cube([70.2, 51.84, 7.4]);
        }
        for(fin=[1.44:3.60:51.2]) {
            translate([-EPS, fin, 3.4]) cube([76.2+2*EPS, 2.16, 4+EPS]);
        }
        translate([34, 51.84/2, -EPS]) cylinder(h=4, d=40.5);
    }
}

module PodBusExpressOut() {
    // TODO: define dims
    // TODO: align with center axis
    // TODO: fix indenting
    color("#202423", 1.0) union() {
        difference() {
            cube([54.2, 5, 8.4]);
            hull() {
                translate([6.47, -EPS, 2.04]) cube([41.26, 4.28, 5.72]);
                translate([7.87, -EPS, 0.64]) cube([38.46, 4.28, 2.5]);
            }
        }
        translate([2.63+6.47, -EPS, 4.2-1.6]) cube([16, 4.1, 1.4]);
        translate([2.63+6.47, -EPS, 4.2+0.4]) cube([16, 4.1, 1.4]);
        translate([22.63+6.47, -EPS, 4.2-1.6]) cube([16, 4.1, 1.4]);
        translate([22.63+6.47, -EPS, 4.2+0.4]) cube([16, 4.1, 1.4]);
    }
    for(x=[0:1]) {
    for(y=[0:1]) {
    translate([2.63+6.47+0.75+20*x, 0.5, 4.2+0.4+1.4-3.4*y]) rotate([-90, 0, 0])
    for(pin=[0:0.5:14.9]) {
        color("darkgoldenrod") translate([pin, 0, 0]) cylinder(h=4, d=0.26);
    }}}
}

module PodBusExpressIn() {
    // TODO: create definition
    // TODO: define dims
    // TODO: align with center axis
}
