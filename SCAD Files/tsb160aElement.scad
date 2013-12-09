$fa=0.01;
$fs=0.5;

module capsuleCover() {
	cylinder(r=16.1/2, h=6.2,center=true);
}

//translate([0,0,-3.6])

module backPlate() {
	color([0,1,0])
	union() {
		difference() {
			cylinder(r=16.1/2, h=1,center=true);
			cylinder(r=(16.1/2)-3, h=1.5,center=true);
		}
	cube([3.,11,1],center=true);
	}	
}

module terminals() {
	union() {
		cylinder(r=1,h=2.5);
	}
}

module tsb160aElement() {
	translate([0,0,-3.6])
	capsuleCover();
	backPlate();
	terminals();	
}

tsb160aElement();

//for (i=1:6) {
//	translate([4,0,0])
//	rotate([])
//}