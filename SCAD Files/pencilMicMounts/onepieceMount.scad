$fa=0.01;
$fs=0.5;

module end() {
import("/Volumes/Squirrel/audioHack/micMounting/STLs/shockMountEndThinner2.stl");
}

module middle() {
	union() {
		translate([-15,0,34.9375])
		cylinder(r=3.25,h=20.625,center=true);
		translate([15,0,34.9375])
		cylinder(r=3.25,h=20.625,center=true);
	}

difference() {
	union() {
		translate([-15,0,-35.05])
		cylinder(r=3.25,h=17,center=true);
		translate([15,0,-35.05])
		cylinder(r=3.25,h=17,center=true);
	}
	rotate([180,0,0])
	difference() {
		translate([0,0,32.6])
		rotate([0,90,0])		
		cylinder(r=8,h=40,center=true);	
	
		translate([0,0,32.6])
		rotate([0,90,0])
		cylinder(r=3.25,h=41,center=true);
		
		translate([0,0,37])
		cube([42,17,8],center=true);	
	}
}

	translate([0,0,-32.6])
	rotate([0,90,0])
	cylinder(r=3.25,h=29.4, center=true);





difference() {

	hull() {
		translate([3,0,-9])
		cylinder(r=3.25,h=46.55,center=true);
		translate([-3,0,-9])
		cylinder(r=3.25,h=46.55,center=true);
	}

}
	
	translate([0,0,5])
	difference() {	
		hull() {
			translate([0,0,19.16])
			rotate([90,0,0])
			cylinder(r=12,h=6.5,center=true);
			
			union() {
				translate([-15,0,19.16])
				cylinder(r=3.25,h=10,center=true);
				translate([15,0,19.16])
				cylinder(r=3.25,h=10,center=true);
			}

		translate([0,0,27.93])
		rotate([0,90,0])
		cylinder(r=3.25,h=29.4, center=true);
		}
		
		translate([0,1.5,19.16])
		rotate([90,0,0])
		cylinder(r=7.9375,h=10);
	}
}

translate([0,0,0.75])
rotate([90,180,0])
middle();

//translate([0,-33.5,1])
//end();
//
//translate([0,32,1])
//rotate([0,0,180])
//end();

//translate([0,39.6,20.25])
//rotate([-90,0,0])
//rotate([0,0,180])
//%end();
//
//translate([0,-40.6,20.25])
//rotate([-90,0,0])
//rotate([0,0,180])
//%end();

//translate([0,0,-6])
//color("yellow")
//cube([140,140,0.1],center=true);
