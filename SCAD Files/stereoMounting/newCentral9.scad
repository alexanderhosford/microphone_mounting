use <MCAD/boxes.scad>
use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

module centralPiece() {
	difference() {
	
		hull() {

			cylinder(r=18,h=25,center=true);
			
			union() {
				translate([0,23,0]) {
					cylinder(r=12.5,h=25,center=true);
				}
				
				translate([-20,10,0]) {
					rotate([90,0,0]) {
						cylinder(r=12.5,h=24.05,center=true);
					}
				}
			}
		}
		
	///////////////////SUBTRACTION
		union() {
			cube([20.125,20.125,50],center=true);
		
			union() {
				translate([0,0,-25.5]) {
					sphere(20);
				}
				translate([0,0,25.5]) {
					sphere(20);
				}
			}
		
			//thread adapter recesses
			union() {
				translate([0,25,0])
				cylinder(r=7.9375,h=24.05);
			
				translate([-22,10,0])
				rotate([90,0,0])
				cylinder(r=7.9375,h=24.05);
			
			}
		}
	
		translate([0,-7,0]) {
			rotate([90,0,0]) {
				hexBolt("M6");
			}
		}
	}

}

centralPiece();

