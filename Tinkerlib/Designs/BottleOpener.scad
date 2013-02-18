
/********************************************************************
 * TinkerLib : Bottle Opener
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 * 
 * Inspired by Nick Starno's Bottle Opener on Thingiverse :
 * http://www.thingiverse.com/thing:1842
 *******************************************************************/

DETAIL=120;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

BOTTLE_OPENER_WIDTH=0;
BOTTLE_OPENER_BOTTLE_RADIUS=1;
BOTTLE_OPENER_HANDLE_LENGTH=2;
BOTTLE_OPENER_LANYARD_RADIUS=3;
BOTTLE_OPENER_MAGNET_RADIUS=4;
BOTTLE_OPENER_COIN_RADIUS=5;
BOTTLE_OPENER_COIN_THICKNESS=6;
BOTTLE_OPENER_THICKNESS=7;
BOTTLE_OPENER_ROUNDOVER=8;
BOTTLE_OPENER_BOTTLE_TOP_OFFSET=9;


OPENER1=[
	25,		// BOTTLE_OPENER_WIDTH
	30,		// BOTTLE_OPENER_BOTTLE_RADIUS
	55,		// BOTTLE_OPENER_HANDLE_LENGTH
	1.25,	// BOTTLE_OPENER_LANYARD_RADIUS
	5,		// BOTTLE_OPENER_MAGNET_RADIUS
	9.5,	// BOTTLE_OPENER_COIN_RADIUS
	1.8,	// BOTTLE_OPENER_COIN_THICKNESS
	12,		// BOTTLE_OPENER_THICKNESS
	2.5,	// BOTTLE_OPENER_ROUNDOVER
	8,		// BOTTLE_OPENER_BOTTLE_TOP_OFFSET
];

module drawOpener(data)
{
	difference()
	{
		union()
		{
			drawChamferedCube([data[BOTTLE_OPENER_THICKNESS],data[BOTTLE_OPENER_WIDTH],data[BOTTLE_OPENER_BOTTLE_RADIUS]],data[BOTTLE_OPENER_ROUNDOVER]);
			rotate([0,45,0])
			translate([-2,0,3])
			drawChamferedCube([data[BOTTLE_OPENER_HANDLE_LENGTH],data[BOTTLE_OPENER_WIDTH],data[BOTTLE_OPENER_THICKNESS]],data[BOTTLE_OPENER_ROUNDOVER]);

			// Draw a half cylinder to push on the bottle top and create the right angle
			rotate([90,0,0])
			translate([data[BOTTLE_OPENER_THICKNESS],22,-22])
			drawRoundedCylinder(data[BOTTLE_OPENER_COIN_RADIUS]*2,
				data[BOTTLE_OPENER_THICKNESS]/4,data[BOTTLE_OPENER_THICKNESS]/4);
		}

		// Draw the slot for the washer/coin
		color("red")
		translate([data[BOTTLE_OPENER_THICKNESS]+data[BOTTLE_OPENER_BOTTLE_TOP_OFFSET],(data[BOTTLE_OPENER_WIDTH]-data[BOTTLE_OPENER_COIN_RADIUS]*2)/2,-10])
		rotate([0,-5,0])
		# cube([data[BOTTLE_OPENER_COIN_THICKNESS],data[BOTTLE_OPENER_COIN_RADIUS]*2,data[BOTTLE_OPENER_COIN_RADIUS]*2]);

		// Draw the lanyard hole
		translate([0,data[BOTTLE_OPENER_WIDTH]/2,(data[BOTTLE_OPENER_HANDLE_LENGTH]-2)*-1*sqrt(2)+data[BOTTLE_OPENER_LANYARD_RADIUS]*8])
		rotate([0,45,0])
		# cylinder(data[BOTTLE_OPENER_THICKNESS]*10,data[BOTTLE_OPENER_LANYARD_RADIUS]*2,data[BOTTLE_OPENER_LANYARD_RADIUS]*2,$ofn=DETAIL);
	}
}

//scale([2,2,2])
rotate([90,0,0])
drawOpener(OPENER1);

