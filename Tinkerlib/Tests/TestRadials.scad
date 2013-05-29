
include <..\Tinkerlib\TinkerLib.scad>;

DETAIL=100;

TUBE_DISTANCE=10;
TUBE_ANGLE=20;
TUBE_HEIGHT=40;
TUBE_RADIUS1=20;
TUBE_RADIUS2=19.75;
SPHERE_RADIUS1=17;
SPHERE_RADIUS2=16;
HOLLOW=1;
BASE_HEIGHT=2;
BASE_RADIUS=10;
BASE_OFFSET=5;

module testRadials1()
{
	difference()
	{
		intersection()
		{
			drawRadialShapes(TUBE_DISTANCE, TUBE_ANGLE)
			drawTube(TUBE_HEIGHT, TUBE_RADIUS1,TUBE_RADIUS2);

			translate([0,0,TUBE_HEIGHT/2])
			drawSphere(SPHERE_RADIUS1);
		}

		if ( HOLLOW == 1 )
		{
			translate([0,0,TUBE_HEIGHT/2])
			drawSphere(SPHERE_RADIUS2);
		}
	}

	// Draw the base
	translate([0,0,BASE_OFFSET])
	drawCylinder(BASE_HEIGHT, BASE_RADIUS);
}

scale([1.5,1.5,1.5])
testRadials1();
