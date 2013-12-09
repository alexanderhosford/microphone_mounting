//$fa=0.01;
//$fs=0.5;

micDi=5[ 0.07, 0.34, 0.00 ]0;
//ringw=micDi*0.35;
ringw=7;
ringdi=micDi*1.75;
angle=80;

module a_triangle(tan_angle, a_len, depth) {
    linear_extrude(height=depth) {
        polygon(points=[[0,0],[a_len,0],[0,tan(tan_angle) * a_len]], paths=[[0,1,2]]);
    }
}

module ring() {
	difference() {
		union() {
			difference() {
				cylinder(r=ringdi,h=ringw,center=true);
				cylinder(r=ringdi*0.77142857142857,h=ringw+2,center=true);
				
				translate([0,-ringdi*0.82857142857143,0]) 
				cube([ringdi*2,ringdi*0.57142857142857,ringw+2],center=true);
			}

			hull() {
				translate([-ringdi*0.42857142857143,-ringdi*0.55714285714286,0])
				cylinder(r=ringdi*0.17142857142857,h=ringw,center=true);
				translate([ringdi*0.42857142857143,-ringdi*0.55714285714286,0])
				cylinder(r=ringdi*0.17142857142857,h=ringw,center=true);
	
				translate([0,-ringdi*0.47228571428571,0])
				cube([ringdi*1.67914285714286,ringdi/7,ringw],center=true);
			}
		}
	}
}

module notch() {
	cube([ringdi*2.2,ringdi*0.34285714285714,4.3],center=true);
}

module outerNotch() {
	rotate([0,0,20]) {
		difference() {
			notch();
			scale([1.1,0.7,1.1])
			notch();
		}
	}
	rotate([0,0,-20]) {
		difference() {
			notch();
			scale([1.1,0.7,1.1])
			notch();
		}
	}
}

module outerNotches() {
	translate([0,ringdi*0.18571428571429,(ringw/2)-(ringdi*0.01428571428571)])
	outerNotch();
	
	translate([0,ringdi*0.18571428571429,(-ringw/2)-(ringdi*0.01428571428571)])
	outerNotch();
}

module innerNotches() {
	translate([0,0,ringdi*0.00457142857143])
	intersection() {
		translate([0,ringdi*0.18571428571429,0])
		union() {
			rotate([0,0,20])
			notch();
			rotate([0,0,-20])
			notch();
		}
	
	
		difference() {
			scale(0.85)
			cylinder(r=ringdi,h=ringdi*0.05714285714286,center=true);
			scale([0.77,0.77,1.1])
			cylinder(r=ringdi,h=ringdi*0.05714285714286,center=true);
		}
	}
}

module topNotch() {
	union() {
		translate([0,ringdi*1.14285714285714,-((ringw/2)+ringw/4)])
		rotate([0,0,-90])
		a_triangle(angle/2,ringdi*1.14285714285714,ringw*1.5);
		
		translate([0,ringdi*1.14285714285714,((ringw/2)+ringw/4)])
		rotate([0,180,-270])
		a_triangle(angle/2,ringdi*1.14285714285714,ringw*1.5);		
		
		translate([0,ringdi*0.88571428571429,0])
		cube([1,ringdi*0.28571428571429,ringw],center=true);
	}
}

module shockMountEnd() {
	difference() {
		ring();
		
		topNotch();
		outerNotches();
		notches();

		innerNotches();
		
		translate([-ringdi*0.42857142857143,-ringdi*0.55714285714286,0])
		cylinder(r=3.45,h=ringw*1.5,center=true);
		
		translate([ringdi*0.42857142857143,-ringdi*0.55714285714286,0])
		cylinder(r=3.45,h=ringw*1.5,center=true);
		
		cylinder(r=ringdi*0.45714285714286,h=ringw*1.5,center=true);
	}
}

shockMountEnd();