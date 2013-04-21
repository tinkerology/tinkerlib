
include <..\Tinkerlib\TinkerLib.scad>;

DETAIL=120;

module testRadials1()
{
	intersection()
	{
		drawRadialShapes(10,20)
		drawTube(40,20,19.5);

		translate([0,0,20])
		drawSphere(17);
	}

	translate([0,0,5])
	drawCylinder(2,10);
}


testRadials1();
