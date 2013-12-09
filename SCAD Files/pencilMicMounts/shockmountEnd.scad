use <MCAD/triangles.scad>

$fa=0.01;
$f =0.5;

ringw=10;
angle=40;

module nt55() {
	cylinder(r=10,h=145,center=true);
}

module se2a() {
	cylinder(r=11,h=162,center=true);
}

module ring() {
	difference() {
		union() {
			difference() {
				cylinder(r=35,h=ringw,center=true);
				cylinder(r=27,h=ringw+2,center=true);
				translate([0,-29,0]) {
					cube([72,20,ringw+2],center=true);
				}
			}
			
			translate([0,-14.,0]) {
				cube([58.5,10,ringw],center=true);
			}
		}
	}
}

module innerNotches() {
	intersection() {
		difference() {
			color([0,1,1])
			cylinder(r=27.75,h=1.5,center=true);
			
			color([0,1,1])
			cylinder(r=26.5,h=2.5,center=true);
		
			translate([0,-19.1,0]) {
				cube([58.5,20,ringw],center=true);
			}
			topNotch();
		}
		
		translate([0,6.5,0]) {
			rotate([0,0,20])
			cube([75,10.5,1.5],center=true);
			rotate([0,0,-20])
			cube([75,10.5,1.5],center=true);
		}
	}
}

module notchset() {
	difference() {
		union() {
			translate([0,5,1])
				cube([75,1.5,10],center=true);
			translate([0,-5,1])
				cube([75,1.5,10],center=true);
	
			translate([0,5,-3.5])
			rotate([0,90,0])
				cylinder(r=1.5,h=100,center=true);
			translate([0,-5,-3.5])
			rotate([0,90,0])
				cylinder(r=1.5,h=100,center=true);
		}
		
		union() {
			translate([0,5,0])
				cube([43,5,5],center=true);
			translate([0,-5,0])
				cube([43,5,5],center=true);
		}
	}
}

module notches() {		
	color([0,0,1])
	translate([-2,6,5])
	rotate([0,0,20])
		notchset(); 
	color([0,1,0])
	translate([2,6,5])
	rotate([0,0,-20])
		notchset();
}

module topNotch() {
	union() {
		translate([0,40,-7])
		rotate([0,0,-90])
			a_triangle(angle/2,40,14);
		translate([0,40,7])
		rotate([0,180,-270])
			a_triangle(angle/2,40,14);		
		translate([0,31,0])
			cube([1,10,14],center=true);
	}
}

module shockMountEnd() {
	difference() {
		ring();
		topNotch();
		notches();
		translate([0,0,1])
			innerNotches();
	}
}

//translate([0,6,0])
//nt55();

shockMountEnd();