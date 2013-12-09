use <MCAD/boxes.scad>
use </Applications/openscad/libraries/Libs.scad>

//$fa=0.01;
//$fs=0.5;

angleMarkR=0.3;
angleMarkH=15;

module micMount() {
difference() {
	
	union() {
		intersection() {
			cylinder(r=18,h=25,center=true);
			translate([0,0,-15])
			sphere(30);
			translate([0,0,15])
			sphere(30);
		}

		translate([22,13,0]) roundedBox([45,10,22.2],3,false);
	}
	
	cube([20.125,20.125,50],center=true);
	
	//Hole for 3/8 K&M screw
	translate([33,23,0]) {
		rotate([90,0,0]) {
			cylinder(r=3.8, h=30);
		}
	}

	translate([0,0,-24.5]) {
		sphere(20);
	}

	translate([0,0,24.5]) {
		sphere(20);
	}
	
	//Bar-fastening shaft
	rotate([0,0,0]) {
		translate([-8,0,0]) {
			nutHole();
//			hexBolt(size="M6", length=15);
		}
	}

//	//Markers for angles
//	difference() {
//		translate([32.5,18,0]) {
//			union() {
//		
//				//90/270°
//				translate([0,0,-10]) {
//					rotate([0,0,0]) {
//						cylinder(r=angleMarkR,h=20);
//					}
//				}
//				rotate([0,22.5,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}		
//				rotate([0,30,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,35,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,40,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,45,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,90,0]) {
//					cylinder(r=angleMarkR,h=11);
//				}		
//				rotate([0,135,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,140,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,145,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,150,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//				rotate([0,157.5,0]) {
//					cylinder(r=angleMarkR,h=angleMarkH);
//				}
//			}
//		}
		
//		translate([33,18,0]) {
//			rotate([90,0,0]) {
//				%cylinder(r=6,h=0.5);
//			}
//		}
	}
}
//}

module nutHole() {
//			translate([0,-8.5,0])
			rotate([270,0,90]) {
				scale([1,1,2])
				hexNut("M6");
				scale([1.1,1.1,1])
				hexBolt("M6");
			}
}

//nutHole();
micMount();