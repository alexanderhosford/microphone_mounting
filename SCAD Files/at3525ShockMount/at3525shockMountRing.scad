use </Applications/openscad/libraries/Libs.scad>
use <MCAD/boxes.scad>

$fa=0.01;
$fs=0.5;


module mainRing() {
	difference() {
		cylinder(r=32.5,h=31,center=true);
		cylinder(r=29.75,h=33,center=true);
		
		translate([0,0,10.25])
		ringBand();

		translate([0,0,-10.25])
		ringBand();

		//bezel edge - large cone
	}
}

module ringBand() {
	difference() {
		cylinder(r=33,h=8.5,center=true);
		cylinder(r=31.5,h=9,center=true);
	}
}

module insideBoxes() {
	translate([0,-29.1,0])
	roundedBox([16,3.1,29],1);
	translate([0,29.1,0])
	roundedBox([16,3.1,29],1);
}

module notches() {
	translate([31,5,11])
	cube([5,2.5,10],center=true);
	translate([33,3,11])	
	rotate([0,0,-45])
	cube([5,2.5,10],center=true);

	translate([31,-5,11])
	cube([5,2.5,10],center=true);
	translate([33,-3,11])	
	rotate([0,0,45])
	cube([5,2.5,10],center=true);
	
	
}

module notchesTrio() {
	for(i=[1:3]) {
		rotate(i*120)
		notches();
	}
}

module ringNotches() {
	notchesTrio();
	
	translate([0,0,-22])
	rotate([0,0,180])
	notchesTrio();
}

module threadHoles() {
	rotate([90,0,0])
	cylinder(r=2.5,h=65,center=true);
}

module bezelEdge() {
	cylinder(r2=32.5,r1=29.75,h=3,center=true);
}

module ring() {
	difference() {
		union() {
			difference() {
				mainRing();
				
				translate([0,-34.1,0])
				cube([18,5,33],center=true);
				translate([0,34.1,0])
				cube([18,5,33],center=true);
				
				translate([0,0,16])
				bezelEdge();

				translate([0,0,-16])
				rotate([180,0,0])
				bezelEdge();
				
			}
			insideBoxes();
		}
		threadHoles();

		ringNotches();
	}
}

ring();

