module arm() {
	import("/Users/panda/Desktop/micMounting/STLs/at3525shockMountArm.stl");
}

module at3525shockMountArmFinal() {
	arm();
	difference() {
		hull() {
			translate([0,-5,-1.8])
			rotate([90,0,0])
				difference() {
				cylinder(r=10,h=20,center=true);
			
			}
			
			translate([0,4.22,0])
			union() {
			
				cube([65,0.5,16.5],center=true);
				
				translate([0,0,-1.8])
				rotate([90,0,0])
				cylinder(r=10,h=2,center=true);
			}
		}
		
		translate([0,-9,-1.8])
		rotate([90,0,0])
		cylinder(r=7.9375,h=21,center=true);
	}
}

rotate([0,180,0])
at3525shockMountArmFinal();
