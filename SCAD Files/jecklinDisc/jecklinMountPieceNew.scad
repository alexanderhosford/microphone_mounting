//include <centralPiece.scad>
use <MCAD/triangles.scad> 
use <discToCentralPiece.scad>

module discMount() {
difference() {
	union() {
		//disc piece
		rotate([0,0,0])
		translate([-170,-20,-9.525])
		difference() {
			intersection() {
				cylinder(r=340/2, h=19.05);
				
				translate([200,0,0]) rotate([0,0,180])
				union() {
					a_triangle(16,200,19.05);
					
					translate([0,0,19.05]) rotate([0,180,0]) a_triangle(16,-200,19.05);
				}
			}
			
			translate([0,0,-5])
			cylinder(r=295/2,h=35.05);
		}
			
	}

	translate([-170,-20,-4]) cylinder(r=335/2,h=8);

}
}

discMount();