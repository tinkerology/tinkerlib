
/********************************************************************
 * TinkerLib : Phone stand
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=120;
FAST=0;

include <..\Tinkerlib\TinkerLib.scad>;

module drawBase()
{
	difference()
	{
		// Draw the outer part of the base
		scale([1,.5,1])
		drawCylinder(20,74);

		// Remove the inside back
		translate([20,0,0])
		scale([1,.55,1])
		drawCylinder(20,70);

		// Sculpt it down from above with a curve
		translate([-20,50,85])
		rotate([90,0,0])
		scale([1.5,1,1])
		drawCylinder(100,80);

		// Make a goove for the bottom of the device
		translate([-66,50,15])
		rotate([90,0,0])
		drawCylinder(100,7);
	}
}

module drawUprightSide()
{
	translate([-45,30,39])
	rotate([0,110,0])
	drawCylinderDifference(5, 50, 70, [5,30,0]);

	translate([-53,7.5,8])
	rotate([0,10,0])
	drawRadiusCylinder(3, 4.5, 2);
}

module drawUpright()
{
	drawUprightSide();
	mirror([0,1,0])
	drawUprightSide();
}

scale([1,1,1])
{
drawBase();
drawUpright();
}
//rotate([0,90,0])
//translate([0,0,-80])
//drawRuler(120, 20);
drawBuildArea();