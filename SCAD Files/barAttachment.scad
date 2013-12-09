use <MCAD/triangles.scad>

module bar() {
	difference() {
		cube([20,300,20],center=true);
		cube([16,310,16],center=true);	
	}
}

//bar();

module magnet() {
	cylinder(r=7.475, h=3.95, center=true);
}



module connector() {
	
	difference() {
		cube(16.45,center=true);
		scale([0.5,1.5,0.5])
		translate([0,-8,0])
		cube(16,center=true);
		notches();
	}

	translate([0,8,0])
	rotate([90,0,0])
	cube([20,20,5],center=true);

	
}

module notches() {
	for(i=[0:3]) {
		rotate([0,i*90,0]) {
			for(d=[-8.3,-5.3,-2.3,1.3]) {
				translate([-8,d,8.5])
				rotate([0,90,0])
				triangle(3,3,16.45);
			}
			
			translate([0,-2.1,8.5])
			cube([16.45,12,1],center=true);
		}
	}
}

rotate([90,0,0])
difference() {
connector();
translate([0,8.53,0])
rotate([90,0,0])
color("gold")
magnet();
}


//module maleConnector() {
//	connector();
//}
//
//module femaleConnector() {
//	connector();
//}

//translate([40,0,0])
//maleConnector();
//
//translate([-40,0,0])
//femaleConnector();

//module triangle(o_len, a_len, depth)
//{
//    linear_extrude(height=depth)
//    {
//        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
//    }
//}

