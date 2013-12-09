use <discMountNew.scad>
use <discClasp.scad>
use <MCAD/triangles.scad>




module claspFlat() {
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
					
					translate([0,0,19.05]) 
					rotate([0,180,0]) 
					a_triangle(16,-200,19.05);
					}
				}
				
				translate([0,0,-5])
				cylinder(r=295/2,h=35.05);
			}	
		}
		
		translate([-170,-20,-15]) 
		cylinder(r=335/2,h=30);
	}
}





module original() {

	difference() {
	centralInverse();
	
	translate([-17,30,0])
	rotate([0,0,40])
	cube([60,20,30],center=true);
	}

	difference() {
	translate([15.1,10,0])
	rotate([0,180,20])
	claspFlat();
	
	translate([40,-30,0])
	cube([60,55,30],center=true);
	}

}

module hulled() {
hull() {


	difference() {
	centralInverse();
	
	translate([-17,30,0])
	rotate([0,0,40])
	cube([60,20,30],center=true);
	}

	difference() {
	translate([15.1,10,0])
	rotate([0,180,20])
	claspFlat();
	
	translate([40,-30,0])
	cube([60,55,30],center=true);
	}
}
}


//original();
hulled();
