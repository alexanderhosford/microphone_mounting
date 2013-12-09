use <MCAD/triangles.scad>
use <MCAD/boxes.scad>

$fa=0.01;
$fs=0.5;

module bar() {
	difference() {
		cube([20,300,20],center=true);
		cube([16,310,16],center=true);	
	}
}

module notches() {
	for(i=[0:3]) {
		rotate([0,i*90,0]) {
			for(d=[-8.3,-5.3,-2.3,0.7]) {
				translate([-8,d,8.5])
				rotate([0,90,0])
				triangle(3,3,16);
			}
			
			translate([0,-2.1,8.5])
			cube([16,12,1],center=true);
		}
	}
}

module roundedEdge() {
		difference() {
		translate([0,0.5,0.5])
		cube([22,1,1],center=true);
		rotate([0,90,0]) 
		cylinder(r=1,h=23,center=true);
		}
}

module roundEdges() {
	for(i=[0:3]) {
		rotate([0,i*90,0]) {
			translate([0,9.55,9.05])
			roundedEdge();
		}
	}
}

module channel() {
	difference() {
		intersection() {
			rotate([90,0,0])
			cylinder(r=8,h=5,center=true);
			
			translate([5,0,5])
			cube([10,5,10],center=true);
		}
		
		rotate([90,0,0])
		cylinder(r=6,h=6,center=true);
	}
	
	translate([0,1.5,0])
	difference() {
		intersection() {
			rotate([90,0,0])
			cylinder(r=9,h=2,center=true);
			
			translate([5,0,5])
			cube([10,5,10],center=true);
		}
		
		rotate([90,0,0])
		cylinder(r=5,h=3.5,center=true);
	}
	
	translate([0,0,7])
	rotate([90,0,0])
	cylinder(r=2,h=5,center=true);
}

module connector() {
	difference() {
		cube(15.8,center=true);
		scale([0.5,1.5,0.5])
		cube(15.8,center=true);
		notches();
	}

	difference() {
		translate([0,8,0])
		rotate([90,0,0])
		cube([20,20,5],center=true);

		roundEdges();
	}
	

}

module maleConnector() {
	difference() {
		union() {
			connector();
		
			translate([0,13,0])	
			rotate([90,0,0])
			cylinder(r=2.5,h=5,center=false);	
		}
		translate([0,9,0])
		rotate([0,90,180])
		channel();
	}

	translate([7,12.95,0])
	peg();
}

module femaleConnector() {
	difference() {
		difference() {
			connector();
			
			translate([0,13,0])	
			rotate([90,0,0])
			scale([1.02,1.02,1])
			cylinder(r=2.5,h=5,center=false);	
		}
		
		translate([0,9,0])
		rotate([0,90,180])
		mirror([1,0,0])
		channel();
	}

	translate([7,12.95,0])
	peg();
}

module peg() {

	rotate([90,0,0])
	cylinder(r=1,h=5,center=true);
	
	translate([0,1.5,0])
	rotate([90,0,0])
	cylinder(r=2,h=2,center=true);
}

//peg();

//bar();

//channel();

//connector();

//translate([0,-20,0])
//maleConnector();

//translate([0,20,0])
//rotate([0,0,180])
//femaleConnector();

module magnet() {
	rotate([90,0,0])
	color("gold")
	cylinder(r=7.5,h=5,center=true);
}

module magnetMaleConnector() {
	connector();
	
//	translate([0,10.5,0])

}

module magnetFemaleConnector() {
	difference() {
		connector();
		
		translate([0,5.6,0])
		rotate([90,0,0])
		cylinder(r=7.5,h=10.1,center=true);
	}
}

//magnetMaleConnector();
magnetFemaleConnector();