// Measurements are based on jig recommendations

angle = 35;
size = 25;

h = 25;

wall=2.5; // because it seems to work

text_depth = .4  * 2; // set to a ratio of your extruder width

// A global overlap variable (to prevent printing glitches)
$o = .06;

// Render the part
chisel_sharpening_jig_key();

/* ******************************************************************************
 * Main module code below:
 * ****************************************************************************** */

module chisel_sharpening_jig_key() {
    rotate([0,-90,0])
    union(){
        difference(){
            translate([0.01,20,0.01]) cube([24.98,9.4,9.4]);
            union() {
                cube([h, size + .1, wall]);
                translate([0,size, 0])
                    cube([h, wall, 5+wall]);
                translate([0,0,-15+$o])
                    cube([h, wall, 15+$o]);
                *translate([0,0, 0])
                    cube([wall, size, 10]);
            }
        }
        translate([0.01,27.6,0]) cube([24.98,5.61,2.4]);
    }
}