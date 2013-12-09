use <MCAD/triangles.scad>

//sE X1R dimensions
//ø57mm
//l.168mm
//455g

angle=140;
angle2=300;
notchLength=70;

micw = 57;
micl = 168;

module x1r() {
	translate([0,0,(micl/5)*2])
	cylinder(r1=micw/2.2,r2=micw/2.5,h=(micl/5)*2,center=true);
	translate([0,0,0])
	cylinder(r=micw/2,h=(micl/5)*2,center=true);
	translate([0,0,-(micl/5)*1.5])
	cylinder(r1=micw/4.5,r2=micw/4,h=micl/5,center=true);
}

x1r();
 	
module topNotch() {
	union() {
		translate([0,notchLength,-7])
		rotate([0,0,-90])
			a_triangle(angle/2,notchLength,14);
		translate([0,notchLength,7])
		rotate([0,180,-270])
			a_triangle(angle/2,notchLength,14);		
		translate([0,52,0])
			cube([1,10,14],center=true);
	}
}

module topNotch2() {
	union() {
		translate([0,notchLength,-7])
		rotate([0,0,-90])
			a_triangle(angle2/2,notchLength,14);
		translate([0,notchLength,7])
		rotate([0,180,-270])
			a_triangle(angle2/2,notchLength,14);		
		translate([0,52,0])
			cube([1,10,14],center=true);
	}
}

module outerRing() {
	difference() {
		difference() {
			cylinder(r=micw,h=10,center=true);
			cylinder(r=micw*0.85,h=11,center=true);
		}
		topNotch();
	}
}

module ringBack() {
	difference() {
		union() {
			hull() {
				intersection() {
					difference() {
						cylinder(r=micw,h=10,center=true);
						cylinder(r=micw*0.85,h=11,center=true);
					}
					topNotch2();
				}
				translate([0,55,0])
				rotate([90,0,0])
					cylinder(r=12.5,h=14.05,center=true);
			}
			translate([0,60,0])
			rotate([90,0,0])
				cylinder(r=12.5,h=24.05,center=true);
		}	
		translate([0,70,0])
		rotate([90,0,0])
			cylinder(r=7.9375,h=24.05,center=true);	
	}
}

outerRing();

rotate([180,0,0])
ringBack();
