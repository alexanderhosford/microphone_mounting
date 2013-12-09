$fa=0.01;
$fs=0.5;

capDia = 20;

module body() {
	cylinder(r=19/2, h=150, center=true);
}

module capsule() {
	union() {
		cylinder(r=capDia/2, h=29.08, center=true);
	
		translate([0,0,((29.08/2)+2.5)])
		cylinder(r1=capDia/2,r2=11.08/2,h=5,center=true);
	
		translate([0,0,((29.08/2)+2.5)+11.13/2])
		cylinder(r=11.08/2, h=11.13, center=true);
	}
}

//translate([0,60,0])
//body();

capsule();

