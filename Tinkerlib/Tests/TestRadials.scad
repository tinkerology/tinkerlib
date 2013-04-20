
/********************************************************************
 * TinkerLib : Test code
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <..\Tinkerlib\TinkerLib.scad>;

DETAIL=120;

module testRadials1()
{
	intersection()
	{
		drawRadialShapes(10,20)
		drawTube(30,20,19.5);

		translate([0,0,20])
		drawSphere(17);
	}

	translate([0,0,5])
	drawCylinder(2,10);
}


testRadials1();
