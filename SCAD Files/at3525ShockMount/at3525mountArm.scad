use </Applications/openscad/libraries/Libs.scad>
use <MCAD/boxes.scad>

$fa=0.01;
$fs=0.5;

module armRear() {
	import("/Users/panda/Desktop/micMounting/STLs/at3525shockMountArmFlat.stl");
}

module armRing() {
	cylinder(r=9,h=2,center=true);
}

module armRingCenter() {
	cylinder(r=5,h=3,center=true);
}

module armRings() {
	translate([34,0,0])
	rotate([0,90,0])
	armRing();
	
	translate([-34,0,0])
	rotate([0,90,0])
	armRing();
}

module armRingCenters() {
	translate([34,0,0])
	rotate([0,90,0])
	armRingCenter();
	
	translate([-34,0,0])
	rotate([0,90,0])
	armRingCenter();
}

module armFront() {
	rotate([134.5,0,0])
	cube([2,25,16.5],center=true);
}

module curveJoin() {
	difference() {
		translate([34,72.4,-8.19])
		rotate([0,90,0])
		cylinder(r=16.5,h=2,center=true);
		
		translate([34,62.48,-8.25])
		cube([3,20,40],center=true);
	
		translate([34,84.52,-10.5])
		rotate([134.5,0,0])
		cube([3,20,40],center=true);
	}
}

module at35mountArm() {
	difference() {
		union() {
			%armRear();
		
			translate([-34,87,-11.4])
			armFront();
			translate([34,87,-11.4])
			armFront();
		
			curveJoin();
			translate([-68,0,0])
			curveJoin();
		
			translate([0,98,-22.6])
			armRings();	
		}
		
		translate([0,98,-22.6])		
		armRingCenters();
	}
}

at35mountArm();