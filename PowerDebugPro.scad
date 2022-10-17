PowerDebugPro();

use <LauterbachComponents.scad>

$fn=36;
EPS=0.01;

module PCB() {
    // TODO: maintain the same dimensioning standard as LauterbachComponents
    color("#6B7568") difference() {
        cube([171, 70, 1.6]);
        translate([-EPS, -EPS, -EPS]) cube([3+EPS, 14.8+EPS, 1.6+2*EPS]);
        translate([-EPS, 61.0, -EPS]) cube([3+EPS, 9.0+EPS, 1.6+2*EPS]);
    }
}

module PowerDebugPro() {
    /* TODO:
     *   The standard offset for each component is in the
     *   process of being standardized! Each component
     *   offset will probably need to be changed. This
     *   should (when finished) simplify assembly
     *   dimensioning!
     */
    difference() {
        translate([0, 0, 0]) PowerDebugBlock();

        translate([-EPS, 2.8, 5.5-1.6]) PCB();
        hull() translate([-0.1, 56.9+3.25-1, 5.5+4.5]) scale([1,1.2,1]) rotate([0, 0, -90]) TriggerTerminal();
        hull() translate([-0.2, 39.4+8.15, 5.5+6.55]) rotate([0, 0, -90]) EthPort();
        hull() translate([-0.1, 27.0+6.2, 5.5+7.05]) rotate([0, 0, -90]) USB30TypeB();
        hull() translate([-0.1, 17.8+4.6, 5.5+6.0]) rotate([0, 0, -90]) BarrelJack();
        hull() translate([12+19.48, 78.4-3, 5.5+4.18]) _DSub25Outer();  // DSub25Pins();
        hull() translate([12+19.48, -2.9, 5.5+4.18]) _DSub25Outer();  // DSub25Socket();
        hull() translate([88.6, 0, 7.3]) cube([54.2, 5, 8.4]);  // PodBusExpressOut();
        hull() translate([176.5-3, 19.3+19.48, 5.5+4.18]) rotate([0, 0, -90]) _DSub25Outer();  // DSub25Pins();
    }
    translate([-EPS, 2.8, 5.5-1.6]) PCB();
    translate([-0.1, 56.9+3.25-0.3, 5.5+4.5]) rotate([0, 0, -90]) TriggerTerminal();
    translate([-0.2, 39.4+8.15, 5.5+6.55]) rotate([0, 0, -90]) EthPort();
    translate([-0.1, 27.0+6.2, 5.5+7.05]) rotate([0, 0, -90]) USB30TypeB();
    translate([-0.1, 17.8+4.6, 5.5+6.0]) rotate([0, 0, -90]) BarrelJack();
    translate([12+19.48, 78.4-3, 5.5+4.18]) DSub25Pins();
    translate([12+19.48, -2.9, 5.5+4.18]) DSub25Socket();
    translate([88.6, 0, 7.3]) PodBusExpressOut();
    translate([44.2,13.3,21.4-0.4]) HeatSink();
    translate([176.5-3, 19.3+19.48, 5.5+4.18]) rotate([0, 0, -90]) DSub25Pins();
}