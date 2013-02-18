
/********************************************************************
 * TinkerLib : Interconnected hollow cubes
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=30;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

module drawHollowCube(size,factor)
{
	difference()
	{
		cube([size,size,size],center=true);

		cube([size,size*factor,size*factor],center=true);
		cube([size*factor,size,size*factor],center=true);
		cube([size*factor,size*factor,size],center=true);
	}
}

module drawHollowCubes(size,factor)
{
	drawBuildArea();

	translate([0,0,size])
	{
		rotate([45,45,0])
		drawHollowCube(size,factor);

		translate([size/2,size/2,0])
		rotate([45,45,0])
		drawHollowCube(size,factor);
	}
}

module drawRotatedCube()
{
		rotate([45,45,45])
		cube([20,20,20],center=false);

		cube([20,20,20],center=false);
}

//drawRotatedCube();
drawHollowCubes(40,.85);