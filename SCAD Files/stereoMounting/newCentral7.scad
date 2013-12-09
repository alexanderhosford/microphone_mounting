use <MCAD/boxes.scad>
use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

angle=10;

module centralPiece() {
	difference() {
	
		hull() {
			intersection() {
				cylinder(r=17,h=25,center=true);
				translate([0,0,-5]) {
					sphere(30);
				}
				translate([0,0,5]) {
					sphere(30);
				}
			}
			
			union() {
				translate([30,angle,0]) {
					cylinder(r=13,h=26,center=true);
				}
				
				translate([-30,-angle,0]) {
					rotate([90,0,0]) {
						cylinder(r=13,h=24.05,center=true);
					}
				}
			}
		}
		
	///////////////////SUBTRACTION
		union() {
			cube([20.125,20.125,50],center=true);
		
			union() {
				translate([0,0,-24.5]) {
					sphere(20);
				}
				translate([0,0,24.5]) {
					sphere(20);
				}
			}
		
			//thread adapter recesses
			union() {
				translate([30,angle,0])
				cylinder(r=7.9375,h=24.05);
			
				translate([-30,-angle,0])
				rotate([90,0,0])
				cylinder(r=7.9375,h=24.05);
			
			}
		}
	
		
	}

}

centralPiece();