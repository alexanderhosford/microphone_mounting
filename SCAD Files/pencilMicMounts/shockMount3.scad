use <shockMountEnd2.scad>

$fa=0.01;
$f =0.5;


module shockmountJoin() {
	union() {
		translate([-15,0,0])
		cylinder(r=3.25,h=82.5,center=true);
		translate([15,0,0])
		cylinder(r=3.25,h=82.5,center=true);
	}
	
	translate([0,0,28])
	rotate([0,90,0])
	cylinder(r=3.25,h=28,center=true);
	translate([0,0,-28])
	rotate([0,90,0])
	cylinder(r=3.25,h=28,center=true);

	difference() {	
		hull() {
			translate([0,0,10])
			rotate([90,0,0])
			cylinder(r=12,h=5.7,center=true);
			
			union() {
				translate([-15,0,10])
				cylinder(r=3,h=10,center=true);
				translate([15,0,10])
				cylinder(r=3,h=10,center=true);
			}
		}
		
		translate([0,1.5,10])
		rotate([90,0,0])
		cylinder(r=7.9375,h=10);
	}
}

//translate([0,14,36.25])
//shockMountEnd();
//translate([0,14,-36.25])
//shockMountEnd();

//rotate([0,0,0])
//nt55();

rotate([90,180,0])
shockmountJoin();



