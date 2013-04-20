
/********************************************************************
 * TinkerLib : Sanding blocks
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=90;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

LENGTH=75;
WIDTH=40;
HEIGHT=20;
RADIUS1=0;
RADIUS2=0;
RADIUS3=3;
RADIUS4=3;
EDGE_OFFSET=4;
SANDPAPER_THICKNESS=1;
SANDPAPER_DEPTH=8;

module drawSandingBlock()
{
	difference()
	{
		drawChamferedCube([LENGTH,WIDTH,HEIGHT],2);

		translate([-1*DIFFERENCE_FUDGE,RADIUS1+EDGE_OFFSET,HEIGHT])
		rotate([0,90,0])
		drawCylinder(LENGTH+DIFFERENCE_FUDGE*2,RADIUS1);

		translate([-1*DIFFERENCE_FUDGE,WIDTH-RADIUS2-EDGE_OFFSET,HEIGHT])
		rotate([0,90,0])
		drawCylinder(LENGTH+DIFFERENCE_FUDGE*2,RADIUS2);

		translate([-1*DIFFERENCE_FUDGE,WIDTH-RADIUS3-EDGE_OFFSET,0])
		rotate([0,90,0])
		drawCylinder(LENGTH+DIFFERENCE_FUDGE*2,RADIUS3);

		translate([-1*DIFFERENCE_FUDGE,RADIUS4+EDGE_OFFSET,0])
		rotate([0,90,0])
		drawCylinder(LENGTH+DIFFERENCE_FUDGE*2,RADIUS4);

		// Cut out slots for the sanding paper
		translate([-1*DIFFERENCE_FUDGE,0,HEIGHT/2])
		cube([LENGTH+DIFFERENCE_FUDGE*2,SANDPAPER_DEPTH,SANDPAPER_THICKNESS]);
		translate([-1*DIFFERENCE_FUDGE,WIDTH-SANDPAPER_DEPTH,HEIGHT/2])
		cube([LENGTH+DIFFERENCE_FUDGE*2,SANDPAPER_DEPTH,SANDPAPER_THICKNESS]);
	}
}

module drawPrintableSandingBlock()
{
	rotate([0,-90,0])
	drawSandingBlock();
}

//drawSandingBlock();
drawPrintableSandingBlock();
