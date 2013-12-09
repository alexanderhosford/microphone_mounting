//translate([10,0,0])

include <centralPiece.scad>

difference() {

	centralPiece();

	translate([20,-45,0])
	cube([50.9375,65,36.275],center=true);
	
}