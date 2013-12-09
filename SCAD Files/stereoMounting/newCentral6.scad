use <MCAD/boxes.scad>
use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

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
	
		translate([-121,0,0])
		union() {
			union() {
				translate([143,15,0])
				cube([17,10,8],center=true);
				
				translate([143,-15,0])
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