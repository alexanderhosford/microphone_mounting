//$fa=0.01;
//$fs=0.5;

micDi1=20;
micDi2=20;
ringw=7;
ringdi1=micDi1*1.75;
ringdi2=micDi2*1.75;

module end() {
import("/Volumes/Squirrel/audioHack/micMounting/STLs/shockMountEndThinner2.stl");
}

module middle() {
	union() {
		translate([-ringdi1*0.42857142857143,0,34.9375])
		cylinder(r=3.25,h=20.625,center=true);
		translate([ringdi1*0.42857142857143,0,34.9375])
		cylinder(r=3.25,h=20.625,center=true);
	}

	difference() {
		union() {
			translate([-ringdi1*0.42857142857143,0,-35.05])
			cylinder(r=3.25,h=17,center=true);
			translate([ringdi1*0.42857142857143,0,-35.05])
			cylinder(r=3.25,h=17,center=true);
		}
		
		rotate([180,0,0])
		difference() {
			translate([0,0,32.6])
			rotate([0,90,0])		
			cylinder(r=8,h=ringdi1*1.14285714285714,center=true);	
		
			translate([0,0,32.6])
			rotate([0,90,0])
			cylinder(r=3.25,h=ringdi1*1.17142857142857,center=true);
			
			translate([0,0,37])
			cube([ringdi1*1.2,17,8],center=true);	
		}
	}

	translate([0,0,-32.6])
	rotate([0,90,0])
	cylinder(r=3.25,h=ringdi1*0.84, center=true);
	
union() {
		%hull() {
			translate([ringdi1*0.08571428571429,0,-9])
			cylinder(r=3.25,h=46.55,center=true);
			translate([-ringdi1*0.08571428571429,0,-9])
			cylinder(r=3.25,h=46.55,center=true);
		}
		
		hull() {
			translate([ringdi1*0.08571428571429,0,-20])
			cylinder(r=3.25,h=6.55,center=true);
			translate([-ringdi1*0.08571428571429,0,-20])
			cylinder(r=3.25,h=6.55,center=true);
			translate([0,0,-32.6])
			rotate([0,90,0])
			cylinder(r=3.25,h=ringdi1*0.51428571428571,center=true);
		}
	}
	translate([0,0,5])
	difference() {	
		hull() {
			translate([0,0,19.16])
			rotate([90,0,0])
			cylinder(r=12,h=6.5,center=true);
			
			union() {
				translate([-ringdi1*0.42857142857143,0,19.16])
				cylinder(r=3.25,h=ringdi1*0.28571428571429,center=true);
				translate([ringdi1*0.42857142857143,0,19.16])
				cylinder(r=3.25,h=ringdi1*0.28571428571429,center=true);
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

translate([0,-33.5,1])
%end();

translate([0,32,1])
rotate([0,0,180])
%end();

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
