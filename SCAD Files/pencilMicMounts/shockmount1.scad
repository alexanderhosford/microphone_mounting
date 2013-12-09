use <shockMountEnd.scad>

$fa=0.01;
$f =0.5;

//translate([0,0,6])
//rotate([90,0,0])
//nt55();

module curve() {
	difference() {		
		cube([20,20,10],center=true);
		
		translate([10,10,0])
			cylinder(r=20,h=12,center=true);
	}
}

module curves() {
	translate([15.4,-21.3,0])
		curve();	
	translate([15.4,21.3,0])
	rotate([0,0,270])
		curve();	
	translate([-15.4,21.3,0])
	rotate([0,0,180])
		curve();	
	translate([-15.4,-21.3,0])
	rotate([0,0,90])
		curve();
}

module centralBar() {
	union() {
		hull() {
	
			cube([10,72.5,10],center=true);
	
			translate([0,0,0])
			rotate([0,0,0])
			cylinder(r=7.9375,h=10,center=true);
		}
		
		curves();
	}
}

module shockmount1() {
	union() {
		translate([0,36.25,0])
		rotate([90,0,180])
		shockMountEnd();
		
		translate([0,-36.25,0])
		rotate([90,0,0])
		shockMountEnd();
		
		translate([0,0,-14])
		centralBar();
	}
}

shockmount1();
