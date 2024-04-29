// PICterminalVESAmount1

$fn = 32;

vesaDist = 75.0;
picDistL = 94.0;
picDistW = 31.0;

vesaHole = 4.2;
picHole = 2.6;

stripWidth = 7.5;
stripThick = 3.0;

picSpacerH = 5.0;

vesaOffset = (picDistL - vesaDist) / 2;

picStrip();
translate([0, 0, stripThick]) {
    translate([0, 0, 0]) spacer();
    translate([picDistL, 0, 0]) spacer();
}    
translate([0, picDistW, 0]) {
    picStrip();
        translate([0, 0, stripThick]) {
            translate([0, 0, 0]) spacer();
            translate([picDistL, 0, 0]) spacer();  
        }  
}

translate([vesaOffset, 0, 0]) vesaStrip();
translate([picDistL - vesaOffset, 0, 0]) vesaStrip();

module vesaStrip() {
    difference() {
        translate([0, picDistW / 2, stripThick / 2]) cube([stripWidth, picDistW, stripThick], true);
        translate([0, picDistW / 2, -0.01]) cylinder(d = vesaHole, h = stripThick + 0.02);
    }
}

module picStrip() {
    difference() {
        translate([0, 0, 0]) strip();
        translate([0, 0, -0.01]) cylinder(d = picHole, h = stripThick + 0.02);
        translate([picDistL, 0, -0.01]) cylinder(d = picHole, h = stripThick + 0.02);   
    } 
}

module picSpacers() {
    translate([0, 0, stripThick]) {
        translate([0, 0, 0]) spacer();
        translate([picDistL, 0, 0]) spacer();
        translate([0, picDistW, 0]) spacer();
        translate([picDistL, picDistW, 0]) spacer();
    }
}

module strip() {
    hull() {
        cylinder(d = stripWidth, h = stripThick);
        translate([picDistL, 0, 0]) cylinder(d = stripWidth, h = stripThick);
    }
}

module spacer() {
    difference() {
        cylinder(d = stripWidth, h = picSpacerH);
        translate([0, 0, -0.01]) cylinder(d = picHole, h = picSpacerH + 0.02);
    }
}