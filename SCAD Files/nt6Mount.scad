use <MCAD/triangles.scad>

//$fa=0.01;
//$fs=0.5;

pinHole=-19.5;

ringw=7;
angle=70;
dia=25;

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
				cylinder(r=dia,h=ringw,center=true);
				cylinder(r=(dia-(dia/4.375)),h=ringw+2,center=true);
				translate([0,-29,0]) {
					cube([(dia*2.05714285714286),(dia*0.57142857142857),ringw+2],center=true);
				}
			}
			hull() {
				translate([-(dia*0.42857142857143),pinHole,0])
				cylinder(r=6,h=ringw,center=true);
				translate([(dia*0.42857142857143),pinHole,0])
				cylinder(r=6,h=ringw,center=true);
	
				translate([0,-(dia*0.47228571428571),0]) {
					cube([(dia*1.67914285714286),(dia/7),ringw],center=true);
				}
			}	
		}
	}
}

module innerNotches() {
	translate([0,0,(ringw/2)-3.2])
	intersection() {
		difference() {
			cylinder(r=(dia*0.81428571428571),h=(dia*0.04285714285714),center=true);
			
			cylinder(r=(dia*0.75714285714286),h=(dia*0.07142857142857),center=true);
		
			translate([0,-(dia*0.54571428571429),0]) {
				cube([(dia*1.67142857142857),(dia*0.57142857142857),ringw],center=true);
			}
		}
		
		translate([0,(dia*0.19228571428571),0]) {
			rotate([0,0,20])
			cube([(dia*2.14285714285714),(dia*0.32828571428571),(dia*0.04285714285714)],center=true);
			rotate([0,0,-20])
			cube([(dia*2.14285714285714),(dia*0.32828571428571),(dia*0.04285714285714)],center=true);
		}
	}
}

module notchset() {
		union() {
			translate([0,(dia*0.14285714285714),-1])
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

