use <MCAD/triangles.scad>
use <MCAD/boxes.scad>

$fa=0.01;
$fs=0.5;

module magnet() {
	color("gold")
	cylinder(r=7.475, h=3.95, center=true);
}

module roundedEdge() {
	difference() {
		translate([0,0.5,0.5])
		cube([20,1,1],center=true);
		rotate([0,90,0]) 
		cylinder(r=1,h=20,center=true);
	}
}

module roundEdges() {
	for(i=[0:3]) {
		rotate([0,i*90,0]) {
			translate([0,9.55,9.05])
			roundedEdge();
		}
	}
}

module tapering() {
	for(i=[1:4]) {
		rotate([0,i*90,0]) {
			translate([-7.5,-8,7.5])
			rotate([0,45,0])
			cube([2,20,1],center=true);

			translate([0,-8,8])
			rotate([45,0,0])
			cube([15,2,1],center=true);
			
			
		}
	}
}

module pin() {
	translate([7,10.2,7])
	rotate([90,0,0])
	cylinder(r=1.505,h=4,center=true);
}


module pins() {
	pin();
	mirror([1,0,1])
	pin();
}


module bevel() {
	translate([8.3,8.3,-3.7])
	rotate([0,-5,45])
	color("red")
	cube([1,5,3.5],center=true);
}

module bevels() {
	for(i=[1:4]) {
		rotate([0,0,i*90])
		bevel();
	}
}


//bevels();

module connector() {

	difference() {
		cube(16.4,center=true);
		translate([0,-5,0])
		cube(14.9,center=true);	
		tapering();
	}		

	difference() {
		translate([0,8,0])
		rotate([90,0,0])
		cube([19.5,19.5,5],center=true);

		roundEdges();

		translate([0,8.53,0])
		rotate([90,0,0]) {
		magnet();}
		
		pins();
		bevels();

	}
}


rotate([270,0,0])
connector();