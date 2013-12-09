use <MCAD/boxes.scad>
use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

module centralPiece() {
	difference() {
	
		hull() {

			cylinder(r=30,h=25,center=true);
			
			union() {
				translate([30,0,0]) {
					cylinder(r=13,h=26,center=true);
				}
				
				translate([-30,0,0]) {
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
				translate([0,0,-25.5]) {
					sphere(20);
				}
				translate([0,0,25.5]) {
					sphere(20);
				}
			}
		
			//thread adapter recesses
			union() {
				translate([30,0,0])
				cylinder(r=7.9375,h=24.05);
			
				translate([-30,0,0])
				rotate([90,0,0])
				cylinder(r=7.9375,h=24.05);
			
			}
		}
	
		translate([-120,0,0])
		union() {
			union() {
				translate([141,15,0])
				cube([17,10,8],center=true);
				
				translate([141,-15,0])
				cube([17,10,8],center=true);
			}
			
			difference() {	
				translate([150,0,0])
				cylinder(r=14,h=8,center=true);
				
				union() {
					translate([150,0,0])
					cylinder(r=10,h=10,center=true);
					
					translate([130,0,0])
					cube([40,20,10],center=true);
				}
			}
		}
	}

}

centralPiece();