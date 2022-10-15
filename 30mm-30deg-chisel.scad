// Measurements are based on jig recommendations

type = "Chisel"; // ["Chisel", "Plane"]

angle = 30; // [30, 25]

/* [Hidden] */

// chisel: 30° = 30mm, 25° = 40mm
// plane: 30° = 38mm, 25° = 50mm
size = 30;

h = 25;

wall=2.4; // because it seems to work

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
    difference() {
        union() {
            cube([h, size + .1, wall]);
            translate([0,size, 0])
                cube([h, wall, 5+wall]);
            translate([0,0,-15+$o])
                cube([h, wall, 15+$o]);
            *translate([0,0, 0])
                cube([wall, size, 10]);
        }

        translate([2,4,wall-text_depth])
            rotate([0,0,0])
            linear_extrude(height = 1.4)
            text(str(angle, "°", type), size=3.5, valign="bottom", font="Liberation Sans", $fn=50);
        translate([4,10,wall-text_depth])
            rotate([0,0,0])
            linear_extrude(height = 1.4)
            text(str(size, "mm"), size=4.5, valign="bottom", font="Liberation Sans", $fn=50);
    }
}