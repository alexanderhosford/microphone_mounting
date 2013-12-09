include <MCAD/boxes.scad>

module discToCentral() {

	pWidth=40.9375;
	pLength=36.275;
	
	difference() {
		translate([0,-20,0]) {
			//cube([43,65,29],center=true);
			roundedBox([43,65,29],3,false);
		}
	
		
		union() {
			difference() {	
				linear_extrude(height=36.275, center=true) {
					polygon(
						points=[[0,0],[6.5,3.5],[26.5,3.5],[40.9375,-3.5],[40.9375,-44],[0,-44]],
						paths=[[0,1,2,3,4,5]]);
				}
			
			
			//The two top grooves
				translate([0,0,-15.08125]) cube([21.5,5.55625,5.55625]);
				translate([0,0,9.525]) cube([21.5,5.55625,5.55625]);
			
			//The two front cylindrical grooves
				translate([0,10,-12.298125]) rotate([90,0,0]) cylinder(h=45,r=2.783125);
				translate([0,10,12.298125]) rotate([90,0,0]) cylinder(h=45,r=2.783125);
				translate([0,-3,0]);
			}
		}
	}
}

discToCentral();