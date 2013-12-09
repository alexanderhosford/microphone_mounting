//$fa=0.01;
//$fs=0.5;

module tascam() {
	dimensions = [35,65,150];
	cube(dimensions,center=true);
}

//color("darkgray")
//tascam();

translate([0,30,0])
cube([69.89,35,120],center=true);

translate([0,-30,0])
cube([69.89,32.8,120],center=true);
