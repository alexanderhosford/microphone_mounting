$fa=0.01;
$fs=0.5;

module clip() {
	difference() {
		cylinder(r=12.5, h=6, center=true);
		cylinder(r=10.25, h=15, center=true);
		translate([0,11,0])
		cube([27,13,7],center=true);	
	}
}

//translate([-60,0,0])
clip();

for(x=[11,-11]) {
	translate([x,4,0])
	cylinder(r=2,h=6,center=true);
}