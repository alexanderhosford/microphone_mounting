use <MCAD/shapes.scad>

$fa=0.01;
$fs=0.5;

module end() {
import("/Volumes/Squirrel/audioHack/micMounting/STLs/shockMountEndThinner2.stl");
}

module ends() {
	for (x=[20,-20]) {
		translate([0,x,0])
		rotate([90,0,0])
		end();
	}
}

module nt6() {
	translate([0,-20,0])
	rotate([-90,0,0])
	color("silver")
	import("/Volumes/Squirrel/audioHack/micMounting/STLs/nt6Capsule.stl");

	translate([0,20,0])
	rotate([-90,-90,0])
	color("burlywood")
	import("/Volumes/Squirrel/audioHack/micMounting/STLs/miniXlrSheath.stl");
}

module middle() {	

	module pipes() {
		for (x=[15,-15]) {
			translate([x,0,0])
			rotate([90,0,0])
			cylinder(r=3.25,h=48,center=true);	
		}
	}

	union() {
		hull() {
			cube([20,32,6.5],center=true);
			scale([1,0.5,1])
			pipes();
		}
		
		pipes();
	}
}

module clip() {

	module box() {
		roundedBox(67,8,30,2);
	}

	difference() {
		box();
		translate([2.5,0,0])
		scale([0.96,0.5,2])
		box();
	}
	
	translate([32,2.2,0])
	cylinder(r=1.6,h=30,center=true);
	translate([32,-2.2,0])
	cylinder(r=1.6,h=30,center=true);
}

translate([0,0,-26])
rotate([90,0,0])
clip();

//nt6();

color("black")
ends();

translate([0,0,-19.5])
middle();

//%color("dark blue")
//cube([60,100,6.2],center=true);