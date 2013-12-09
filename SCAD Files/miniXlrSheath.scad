$fa=0.01;
$fs=0.5;

module sheath() {
	difference() {
		cylinder(r=20/2, h=8, center=true);
		cylinder(r=10.45/2, h=25, center=true);
//		translate([4.5,0,0])
//		cube([4.2,2.5,40],center=true);

		ring();
	}
}

//sheath();


module ring() {
	difference() {
		cylinder(r=21/2,h=2.5,center=true);
		cylinder(r=19/2,h=4,center=true);
	}
}



projection(cut = false) import_stl("/Users/Panda/Desktop/finalSheath.stl");