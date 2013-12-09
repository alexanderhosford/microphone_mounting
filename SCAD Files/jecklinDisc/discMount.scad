use <MCAD/boxes.scad>
use <MCAD/triangles.scad>
use </Users/panda/Desktop/micMounting/centralPiece2.scad>
use </Applications/openscad/libraries/Libs.scad>

$fa=0.01;
$fs=0.5;

module discMount() {

  difference() {

    union() {

      //disc piece
	
      rotate([0,0,0])
        translate([-170,-20,-9.525])
        difference() {
          intersection() {
            cylinder(r=340/2, h=19.05);

            translate([200,0,0]) rotate([0,0,180])
              union() {
                a_triangle(16,200,19.05);

                translate([0,0,19.05]) rotate([0,180,0]) a_triangle(16,-200,19.05);
              }
          }

          cylinder(r=295/2,h=19.05);
        }


      difference() {
        translate([6,0,0]) {
          roundedBox([43,65,29],3,false);
        }

	rotate([0,180,0])
	translate([-20,21.5,0])
	  centralPiece2();
      }
    }

    translate([-170,-20,-4]) cylinder(r=335/2,h=8);

  }
}
discMount();

color([0,0,1])
union() {
	translate([-8,0,0]) {
		hexBolt(size="M3", length=40);
	}
	translate([-8,-25,0]) {
		hexBolt(size="M3", length=40);
	}
	translate([-8,-50,0]) {
		hexBolt(size="M3", length=40);
	}
	translate([0,0,0]) {
		hexBolt(size="M3", length=40);
	}
	translate([0,0,0]) {
		hexBolt(size="M3", length=40);
	}

}



