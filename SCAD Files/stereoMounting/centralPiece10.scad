use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

module magnetPlace() {
	cylinder(r=5.05,h=1.1,center=true);
}

module magnet() {
	color("gold")
	cylinder(r=5,h=1,center=true);
}

module magnetPlaces() {
	translate([-25,25,0])
	rotate([0,90,-65])
	magnetPlace();
	
	translate([-10,32,0])
	rotate([0,90,-65.])
	magnetPlace();
	
	translate([14.5,15,0])
	rotate([0,90,14])
	magnetPlace();
}

module magnets() {
	translate([-25,25,0])
	rotate([0,90,-65])
	magnet();
	
	translate([-10,32,0])
	rotate([0,90,-65.])
	magnet();
	
	translate([14.5,15,0])
	rotate([0,90,14])
	magnet();
}

module centralPieceShape() {
	hull() {
		cylinder(r=18,h=25,center=true);
		
		union() {
			translate([0,23,0])
			cylinder(r=12.5,h=25,center=true);
							
			translate([-20,10,0])
			rotate([90,0,0])
			cylinder(r=12.5,h=24.05,center=true);
		}
		
		magnets();
	}
}

module outline() {
	projection(cut=true)
	centralPieceShape();
}


module centralPiece() {
	union() {
		difference() {
			centralPieceShape();
			magnetPlaces();
			union() {
				cube([20.125,20.125,50],center=true);
			
				union() {
					translate([0,0,-27])
					sphere(20);
					
					translate([0,0,27])
					sphere(20);			
				}
			
				//thread adapter recesses
				union() {
					translate([0,22.5,0])
					cylinder(r=7.9375,h=24.05);
				
					translate([-22,10,0])
					rotate([90,0,0])
					cylinder(r=8,h=24.05);
				}
			}

			translate([0,-8.5,0])
			rotate([90,0,0]) {
				scale([1,1,2])
				hexNut("M6");
				scale([1.1,1.1,1])
				hexBolt("M6");
			}
		}
		
		magnets();	
	}
}

//outline();
//magnets();
//centralPieceShape();
centralPiece();