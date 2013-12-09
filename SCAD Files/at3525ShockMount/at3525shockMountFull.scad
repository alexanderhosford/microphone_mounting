module ring() {
	import("/Users/panda/Desktop/micMounting/STLs/at3525shockMountRing.stl");
}

module arm() {
	import("/Users/panda/Desktop/micMounting/STLs/at3525shockMountArm.stl");
}

translate([0,98,-22.6])
rotate([0,0,90])
ring();

arm();