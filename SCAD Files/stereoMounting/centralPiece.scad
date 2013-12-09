use </Applications/openscad/libraries/Libs.scad>

module centralPiece() {
  //$fa=0.01;
  //$fs=0.5;

  pWidth=40.9375;
  pLength=36.275;

  union() {

    rotate([0,0,180]) translate([-40.9375/2,65,0]) {
      difference() {

        hull() {
          union() {

            //Main polyhedric block	[ 0.00, 0.00, 0.00 ]
            intersection() {

              linear_extrude(height=36.275, center=true) {
                polygon(points=[[0,0],[6.5,3.5],[26.5,3.5],[40.9375,-3.5],[40.9375,-44],[0,-44]],paths=[[0,1,2,3,4,5]]);
              }
              translate([pWidth/2,5,0]) {
                rotate([90,0,0]) {
                  cylinder(r=48/2,h=54);
                }
              }
            }

            hull() {

              //cylindrical protrusion for vertical setup
              intersection() {

                translate([40.9375,-17,-18.1375]) {
                  cylinder(r=14.4375,h=24.05);
                }
                translate([40.9375,-17,0.5]) {
                  sphere(r=22.4375,h=24.05);
                }
                //translate([40.9375,-17,-15.5]) {
                  //sphere(r=22.4375,h=24.05);
                //}
              }	

              //hull() {

                //bottom ring
                intersection() {

                  translate([39.5,-25.5,0]) {
                    rotate([90,0,0]) {
                      cylinder(r=12.9375,h=25);
                    }
                  }
                  translate([39.5,-47,0]) {
                    sphere(r=22.4375,h=24.05);
                  }
                  translate([39.5,-34,0]) {
                    sphere(r=22.4375,h=24.05);
                  }
                }

                //cylidrical outcrop for hex shaft
                translate([14,-36.5,0]) {
                  rotate([90,0,0]) {
                    cylinder(r=3,h=12);
                  }
                }
              //}
            }
          }
        }

        //slot for main bar
        translate([18.5,-17,0]) { 
          cube([20.125,20.125,50],center=true);
        }

        //horizontal adapter recess
        translate([39.5,-55.5,0]) {
          rotate([270,0,0]) color([0,1,1]) cylinder(h=24.05,r=7.9375);
        }

        //vertical adapter recess
        translate([40.9375,-17,-23.1375]) {
          color([0,0,1]) cylinder(h=24.05,r=7.9375);
        }


        //top grooves
        union() {

          translate([0,0,-15.08125]) {
            cube([21.5,5.55625,5.55625]);
          }
          translate([0,0,9.525]) {
            cube([21.5,5.55625,5.55625]);
          }
        }

        //front grooves
        union() {

          translate([0,10,-12.298125]) {
            rotate([90,0,0]) cylinder(h=45,r=2.783125);
          }
          translate([0,10,12.298125]) {
            rotate([90,0,0]) cylinder(h=45,r=2.783125);
          }
        }

        //shaft for hex bolt
        translate([14,-10,0]) {
          rotate([90,0,0]) {
            hexBolt(size="M3", length=50);
          }
        }
      }
    }
  }
}

centralPiece();







