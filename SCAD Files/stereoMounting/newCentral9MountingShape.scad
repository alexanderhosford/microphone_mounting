use <MCAD/boxes.scad>
use <MCAD/shapes.scad>
use </Applications/openscad/libraries/Libs.scad>
use <centralPieceGroove.scad>

//$fa=0.01;
//$fs=0.5;

module centralPieceShape() {
	difference() {
	
		hull() {

			cylinder(r=18,h=25,center=true);
			
			union() {
				translate([0,23,0]) {
					cylinder(r=12.5,h=25,center=true);
				}
				
				translate([-20,10,0]) {
					rotate([90,0,0]) {
						cylinder(r=12.5,h=24.05,center=true);
					}
				}
			}
		}
		
	///////////////////SUBTRACTION
		
	}

}


centralPieceShape();


//ellipsoid(width, height);
//hexagram(height, depth);
//ovalTube(width, height, depth, wall, center = false);
//ellipticalCylinder(width, height, depth);
//ngon(sides, radius, center=false);