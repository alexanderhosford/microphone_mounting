module centralPieceShape() {
	import("centralPieceShape2.stl");
}

module micMount() {
	import("micMountPiece3.stl");
}

module discClasp() {
	import("discClasp.stl");
}

module magnetPlace() {
	cylinder(r=5.05,h=1.1,center=true);
}

module magnet() {
	color("gold")
	cylinder(r=5,h=1,center=true);
}


module magnetPlaces() {
	translate([-25.43,25.91,0])
	rotate([0,90,-65])
	magnetPlace();
	
	translate([-10.43,32.91,0])
	rotate([0,90,-65.])
	magnetPlace();
	
	translate([15.475,15.25,0])
	rotate([0,90,14])
	magnetPlace();
}

module magnets() {
	translate([-25.43,25.91,0])
	rotate([0,90,-65])
	magnet();
	
	translate([-10.43,32.91,0])
	rotate([0,90,-65.])
	magnet();
	
	translate([15.475,15.25,0])
	rotate([0,90,14])
	magnet();
}

module centralWrap() {
	difference() {
		scale([1.2,1.2,0.76])
		centralPieceShape();		
	
		centralPieceShape();		
		magnetPlaces();

		translate([17,-8,0])
		cube([12,31,21],center=true);
		translate([-14,0,0])
		cube([51,44,21],center=true);
	}

	magnets();
}

module disc() {
	difference() {
		translate([122,50,0])
		cylinder(r=150,h=8,center=true);
		discAway();
	}
	
//	rotate([0,0,0])
//	cylinder(r=1,h=300,center=true);
}



%centralPieceShape();
centralWrap();



module jecklin() {
//	translate([20,0,0])
	color("white")
	disc();
	
//	translate([0,20,0])
//	mirror()
//	%discClasp();
}

module nt55() {
	color("silver")
	cylinder(r=10,h=145,center=true);
}

//rotate([90,0,0])
//cube([20,300,20],center=true);

//translate([0,0,80])
//micMount();
//
//translate([0,0,-80])
//micMount();

translate([80,50,80])
rotate([0,90,0])
nt55();

translate([80,50,-80])
rotate([0,90,0])
nt55();

translate([0,0,0])
rotate([0,0,0])
jecklin();

module discAway() {
	hull() {
		centralPieceShape();
		centralWrap();
		translate([-5,-17,0])
		rotate([0,0,45])
		cube([40,20,10],center=true);
	}
}

module newClasp() {
	hull() {
		color("red")
		mirror()
		translate([35,55,0])
		discClasp();

		centralWrap();
	}
}

newClasp();

