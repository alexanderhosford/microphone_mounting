use <MCAD/triangles.scad> 
use </Applications/openscad/libraries/Libs.scad>

$fa=0.01;
$fs=0.5;

module claspShape() {
	difference() {
		union() {
			//disc piece
			rotate([0,0,0])
			translate([-170,-20,-9.525])
			difference() {
				intersection() {
					cylinder(r=340/2, h=19.05);
					
					translate([200,0,0]) rotate([0,0,180])
					union() {
						a_triangle(16,200,19.05);
						
						translate([0,0,19.05]) rotate([0,180,0]) a_triangle(16,-200,19.05);
					}
				}
				
				translate([0,0,-5])
				cylinder(r=295/2,h=35.05);
			}	
		}
	
		translate([-170,-20,-4]) cylinder(r=335/2,h=8);
	}
}

module boltHoles() {
	union() {
		translate([-1,12.66,-25])
		hexBolt("M3",50);

		translate([-3.5,31.32,-25])
		hexBolt("M3",50);

		translate([-1,-12.66,-25])
		hexBolt("M3",50);

		translate([-3.5,-31.32,-25])
		hexBolt("M3",50);
	}
}

module nutHoles() {
	union() {
		scale([1,1,1.1])
		translate([-1,12.66,-9.5]) {
			hexNut("M4");
			translate([0,0,-0.8]) {
				cylinder(r=3,h=4);
			}
		}

		scale([1,1,1.1])
		translate([-1,12.66,6.35]) {
			hexNut("M4");
			cylinder(r=3,h=4);
		}
		
		scale([1,1,1.1])
		translate([-3.5,31.32,-9.5]) {
			hexNut("M4");
			translate([0,0,-0.8]) {
				cylinder(r=3,h=4);
			}
		}

		scale([1,1,1.1])
		translate([-3.5,31.32,6.35]) {
			hexNut("M4");
			cylinder(r=3,h=4);
		}

		scale([1,1,1.1])
		translate([-1,-12.66,-9.5]) {
			hexNut("M4");
			translate([0,0,-0.8]) {
				cylinder(r=3,h=4);
			}
		}

		scale([1,1,1.1])
		translate([-1,-12.66,6.35]) {
			hexNut("M4");
			cylinder(r=3,h=4);
		}


		scale([1,1,1.1])
		translate([-3.5,-31.32,-9.5]) {
			hexNut("M4");
			translate([0,0,-0.8]) {
				cylinder(r=3,h=4);
			}
		}

		scale([1,1,1.1])
		translate([-3.5,-31.32,6.35]) {
			hexNut("M4");	
			cylinder(r=3,h=4);
		}
	}
}

module discClasp() {
	difference() {
	
		claspShape();
	
		translate([-11.5,-20,0])
		boltHoles();
		
		translate([-11.5,-20,0])
		nutHoles();
	}
}

discClasp();