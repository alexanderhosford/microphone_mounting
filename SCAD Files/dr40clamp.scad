//$fa=0.01;
//$fs=0.5;

module tascam() {
	dimensions = [35,65,150];
	cube(dimensions,center=true);
}

module nt6amp() {
	cylinder(r=10, h=150, center=true);
}

module sheath() {
	difference() {
		cylinder(r=10, h=20, center=true);
		cylinder(r=5, h=25, center=true);
		translate([4.5,0,0])
		cube([4.5,2.5,40],center=true);
	}
}

module clip() {
	difference() {
		cylinder(r=12.5, h=6, center=true);
		cylinder(r=10.25, h=15, center=true);
		translate([0,11,0])
		cube([27,13,7],center=true);	
	}
}

translate([-60,0,0])
clip();

translate([0,-60,0])
color("blue")
sheath();

translate([0,60,0])
nt6amp();

color("darkgray")
tascam();