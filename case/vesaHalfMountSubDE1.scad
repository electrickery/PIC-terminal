// vesaMounntHalf1

include <../../libraries/subDE-9.scad>;
$fn = 32;

vesaHoleDist = 75.0;
vesaHoleDiam = 3.5;
frameHeight = 2.0;
frameWidth = 7.0;

rs232BaseWidth = 36.0;
rs232BaseLen = 31.0;
rs232BaseHeight = frameHeight;
rs232SideHeight = 20.0;


module frame() {
    hull() {
        translate([-vesaHoleDist / 2, 0, 0]) cylinder(d = frameWidth, h = frameHeight);
        translate([ vesaHoleDist / 2, 0, 0]) cylinder(d = frameWidth, h = frameHeight);
    }
}

difference() {
    frame();
    translate([-vesaHoleDist / 2, 0, -0.01]) cylinder(d = vesaHoleDiam, h = frameHeight + 0.02);
    translate([ vesaHoleDist / 2, 0, -0.01]) cylinder(d = vesaHoleDiam, h = frameHeight + 0.02);
}

    rs232Base();
    translate([-rs232BaseWidth / 2, rs232BaseLen / 2 - rs232BaseHeight, 0]) subDEpanel();

module rs232Base() {
    // base
    translate([0, -0.01, rs232BaseHeight / 2]) {
        difference() {
            cube([rs232BaseWidth, rs232BaseLen, rs232BaseHeight], true);
            translate([rs232BaseWidth / 2 - 2.5, -rs232BaseLen / 2 + 2.5, -1.01]) cylinder(d = 2.7, h = 2.02);
            translate([-rs232BaseWidth / 2 + 2.5, -rs232BaseLen / 2 + 2.5, -1.01]) cylinder(d = 2.7, h = 2.02);
        }
    }
    //
    translate([0, -rs232BaseLen / 2 + 2.5, rs232BaseHeight]) {
        translate([rs232BaseWidth / 2 - 2.5, 0, 0]) pcbMount();
        translate([-rs232BaseWidth / 2 + 2.5, 0, 0]) pcbMount();
    }
}

module subDEpanel() {
    difference() {
        cube([rs232BaseWidth, rs232BaseHeight, rs232SideHeight]);
        translate([rs232BaseWidth / 2, -0.01, rs232SideHeight / 2 + 2]) rotate([0, 0, 90]) subDEHole(frameHeight + 0.02);
        translate([5, 3, rs232SideHeight / 2 + 2]) rotate([90, 0, 0]) cylinder(d = 6, h = 2);
        translate([30.3, 3, rs232SideHeight / 2 + 2]) rotate([90, 0, 0]) cylinder(d = 6, h = 2);
    }
}

module pcbMount() {
    difference() {
        cylinder(d = 5.0, h = 2.0);
        translate([0, 0, -0.01]) cylinder(d = 2.7, h = 2.02);
    }
}

//translate([0, -1, 5]) color("lightblue") cube([36.0, 28.0, 1.6], true);