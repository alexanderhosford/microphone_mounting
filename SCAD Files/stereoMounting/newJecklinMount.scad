use </Users/Panda/Desktop/micMounting/SCAD Files/newCentral5.scad>

difference() {

	%union() {
		cube([20,40,35],center=true);
		translate([11,0,0])
		cylinder(r=20.1,h=35,center=true);
	}
	
	translate([-23,0,0])
	centralPiece();
}

