use </Applications/openscad/libraries/Libs.scad>
use <MCAD/boxes.scad>

$fa=0.01;
$fs=0.5;

module armPathStraightShape() {
	difference() {
		roundedBox([70,74,26.5],5);
		
		translate([0,0,15.8])
		cube([75,74,15],center=true);
		translate([0,0,-15.8])
		cube([75,74,15],center=true);
	}
}

module armPathRear() {
	difference() {
		armPathStraightShape();
		scale([0.9425,0.94,1.1])
		armPathStraightShape();
		translate([0,20,0])
		cube([66,30,26.5],center=true);
		
		translate([0,35,0])
		rotate([0,0,90])
		cube([5,75,20],center=true);
	}
}

module armRing() {
	difference() {
		cylinder(r=9,h=2,center=true);
		cylinder(r=5.5,h=3,center=true);
	}
}

module armRings() {
	translate([34,0,0])
	rotate([0,90,0])
	armRing();
	
	translate([-34,0,0])
	rotate([0,90,0])
	armRing();
}

translate([0,40,0])
//armRings();

armPathRear();

