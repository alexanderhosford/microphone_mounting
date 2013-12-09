use </Applications/openscad/libraries/Libs.scad>
use <MCAD/boxes.scad>

$fa=0.01;
$fs=0.5;

module armPathStraightShape() {
	difference() {
		roundedBox([70,65,26.5],5);
		
		translate([0,0,15.8])
		cube([75,70,15],center=true);
		translate([0,0,-15.8])
		cube([75,70,15],center=true);
	}
}

module armPath() {
	difference() {
		armPathStraightShape();
		scale([0.94,0.94,1.1])
		armPathStraightShape();
		translate([0,20,0])
		cube([66,30,26.5],center=true);
	}
}




armPath();
