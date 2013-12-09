use <MCAD/triangles.scad>

//$fa=0.01;
//$fs=0.5;

pinHole=-19.5;

ringw=17;
angle=70;

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
			hull() {
				translate([-15,pinHole,0])
				cylinder(r=6,h=ringw,center=true);
				translate([15,pinHole,0])
				cylinder(r=6,h=ringw,center=true);
	
				translate([0,-16.53,0]) {
					cube([58.77,5,ringw],center=true);
				}
			}	
		}
	}
}

module innerNotches() {
	translate([0,0,(ringw/2)-3.2])
	intersection() {
		difference() {
			cylinder(r=28.5,h=1.5,center=true);
			
			cylinder(r=26.5,h=2.5,center=true);
		
			translate([0,-19.1,0]) {
				cube([58.5,20,ringw],center=true);
			}
		}
		
		translate([0,6.73,0]) {
			rotate([0,0,20])
			cube([75,11.49,1.5],center=true);
			rotate([0,0,-20])
			cube([75,11.49,1.5],center=true);
		}
	}
}

module notchset() {
		union() {
			translate([0,5,-1])
				cube([75,1.5,3],center=true);
			translate([0,-5,-1])
				cube([75,1.5,3],center=true);
			
			translate([0,0,-ringw])
			union() {
				translate([0,5,0])
				cube([75,1.5,3],center=true);
				translate([0,-5,0])
				cube([75,1.5,3],center=true);
			}
		}
}

module notches() {		
	translate([0,0,ringw/2]) {
		translate([-2,6,0])
		rotate([0,0,20])
		notchset(); 
	
		translate([2,6,0])
		rotate([0,0,-20])
		notchset();
	}
}

module topNotch() {
	union() {
		translate([0,40,-((ringw/2)+ringw/4)])
		rotate([0,0,-90])
			a_triangle(angle/2,40,ringw*1.5);
		
		translate([0,40,((ringw/2)+ringw/4)])
		rotate([0,180,-270])
			a_triangle(angle/2,40,ringw*1.5);		
		
		translate([0,31,0])
			cube([1,10,ringw],center=true);
	}
}

module shockMountEnd() {
	difference() {
		ring();
		topNotch();
		notches();
		color("red")
			innerNotches();
		translate([-15,pinHole,0])
		cylinder(r=3.45,h=ringw*1.5,center=true);
		translate([15,pinHole,0])
		cylinder(r=3.45,h=ringw*1.5,center=true);
		cylinder(r=16,h=ringw*1.5,center=true);
	}
}


//translate([0,0,-5])
//cube(11);

//translate([0,0,0])
//nt55();

shockMountEnd();

