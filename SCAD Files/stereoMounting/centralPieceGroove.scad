use <MCAD/boxes.scad>
use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

module centralPieceShape() {
	difference() {
	
		hull() {

			cylinder(r=18,h=6,center=true);
			
			union() {
				translate([0,23,0]) {
					cylinder(r=12.5,h=6,center=true);
				}
				
			translate([-20,10,0]) {
				cube([25,24.05,6],center=true);
			}
			}
		}
	}
}


module centralPieceGroove() {
difference() {
	
	scale(1.1)
	centralPieceShape();
	
	scale([0.925,0.925,1.5])
	centralPieceShape();

	translate([-13,-10,0])
	rotate([0,0,-25])
	cube([70,30,10],center=true);
	
	translate([17.5,-5,0])
	cube([10,10,10],center=true);
}

}

centralPieceGroove();

