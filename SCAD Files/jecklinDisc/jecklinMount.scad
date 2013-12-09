include  </Users/panda/Desktop/micMounting/SCAD Files/centralPiece.scad>;



union() {
linear_extrude(height=40)
polygon(
				points=[[0,0],[6.5,3.5],[26.5,3.5],[40.9375,-3.5],[40.9375,-50.5],[12.0625,-50.5],[0,-44]],
				paths=[[0,1,2,3,4,5,6]]);

color([0,0,1]) centralPiece();

}