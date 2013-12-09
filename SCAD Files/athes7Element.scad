//$fa=0.01;
//$fs=0.5;

module athes7Element() {
	union() {
		difference() {
			color("dimgray")
			cylinder(r=20,h=4.1,center=true);
			translate([0,0,1])
				cylinder(r=19.4,h=4.1,center=true);
		}
		color("silver")
		translate([0,0,1])
		cylinder(r=19.4,h=2.1,center=true);
			
		color("dimgray")
		translate([0,0,-3])
		cylinder(r=21.5/2,h=2,center=true);

		translate([0,0,-5])
		cylinder(r=19/2,h=3,center=true);		
	}
}

athes7Element();


