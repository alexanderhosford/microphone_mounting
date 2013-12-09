use <newCentral9Mounting.scad>
use <newCentral9MountingShape.scad>
use <newCentral9MountingSubtract.scad>
use <discClasp.scad>
use <micMountPiece3.scad>
use <MCAD/boxes.scad>
use <MCAD/triangles.scad>

//$fa=0.01;
//$f =0.5;

module centralSlice() {
	intersection() {
		centralPieceShape();
		cube([100,100,1], center=true);
	}
}

module centralInverse() {

	difference() {
		scale([1.15,1.15,0.9])
		centralPieceShape();
		
		/*translate([0,0,13.1])
		scale([1,1,20])
		centralSlice();		
		translate([0,0,-13.1])
		scale([1,1,20])
		centralSlice();*/

		//%scale([0.8,0.8,50])

		scale([1,1,0.95])
		CentralPieceToSubtract();		

		translate([-10,-17,0])
		rotate([0,0,-25])
		cube([100,40,40],center=true);
		
		translate([-30,10,0])
		cube([20,10,30],center=true);

		translate([-25,17,0])
		cube([10,10,30],center=true);

		translate([20,-5,0])
		cube([10,10,25],center=true);
	}
}

module discMount() {

	centralInverse();
	
	translate([15.1,10,0])
	rotate([0,180,20])
	discClasp();
}

module restOfIt() {
	union() {
	
		color([0,0,1])
		centralPiece();
	
		translate([0,0,120])
		color([0,1,0])
		micMount();
	
		translate([0,0,-120])
		color([0,1,0])
		micMount();
	
		%cube([20,20,400],center=true);
	}
}

discMount();
restOfIt();

translate([0,0,0])
rotate([180,180,0])
a_triangle(35,5,10);
