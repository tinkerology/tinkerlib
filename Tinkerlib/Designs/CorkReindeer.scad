
/********************************************************************
 * TinkerLib : Cork Reindeer
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=90;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;


CORK_RADIUS=10.25+0.05;

LEG_ANGLE=30;
LEG_RADIUS=1.25;
LEG_LENGTH=25;
NECK_LENGTH=35;
ANTLER_LENGTH=35;
THICKNESS=1.5;

module drawLegs()
{
	drawTube(LEG_RADIUS*2,CORK_RADIUS+THICKNESS,CORK_RADIUS);

	translate([CORK_RADIUS*cos(30),CORK_RADIUS*sin(30),LEG_RADIUS])
	{
		rotate([0,90,LEG_ANGLE])
		{
			drawRoundedRod(LEG_LENGTH,LEG_RADIUS,LEG_RADIUS);
		}
	}
	translate([CORK_RADIUS*cos(30),CORK_RADIUS*sin(-30),LEG_RADIUS])
	{
		rotate([0,90,-1*LEG_ANGLE])
		{
			drawRoundedRod(LEG_LENGTH,LEG_RADIUS,LEG_RADIUS);
		}
	}
}

module drawFrontLegs()
{
	drawLegs();

	// Draw the neck
	translate([-1*NECK_LENGTH-CORK_RADIUS,0,LEG_RADIUS])
	{
		rotate([0,90,0])
		{
			drawRoundedRod(NECK_LENGTH,LEG_RADIUS,LEG_RADIUS);
		}
	}
}

module drawAntler()
{
	translate([0,0,1])
	rotate([90,0,-90])
	{
		drawRoundedRod(ANTLER_LENGTH,LEG_RADIUS,LEG_RADIUS);

		translate([0,0,ANTLER_LENGTH*.6])
		rotate([0,50,0])
		drawRoundedRod(ANTLER_LENGTH*.3,LEG_RADIUS,LEG_RADIUS);

		translate([0,0,ANTLER_LENGTH*.7])
		rotate([0,-40,0])
		drawRoundedRod(ANTLER_LENGTH*.3,LEG_RADIUS,LEG_RADIUS);
	}
}

drawFrontLegs();
translate([0,38,0])
drawLegs();
translate([0,60,0])
drawAntler();
translate([0,80,0])
drawAntler();
