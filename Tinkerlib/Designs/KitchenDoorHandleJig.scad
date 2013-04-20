
/********************************************************************
 * TinkerLib : Kitchen Door Handle Jig
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <..\Tinkerlib\TinkerLib.scad>;

DETAIL=90;
FAST=1;

HOFFSET=(MM_PER_INCH/2)+(MM_PER_INCH*19/32)-(MM_PER_INCH*(2.5/16));
YOFFSET=MM_PER_INCH*3/2;
HEIGHT=MM_PER_INCH*.6;
HOLE_RADIUS=(MM_PER_INCH/16)+.125;
THICKNESS=2;
EXTRA_OFFSET=MM_PER_INCH/2;
SIDE_FACTOR=.5;

module drawHandleJig()
{
	difference()
	{
		union()
		{
			// Draw the flat base
			cube([HOFFSET+EXTRA_OFFSET, YOFFSET+EXTRA_OFFSET, THICKNESS]);
			// Draw the sides
			cube([THICKNESS,(YOFFSET+EXTRA_OFFSET)*SIDE_FACTOR,HEIGHT]);
			cube([(HOFFSET+EXTRA_OFFSET)*SIDE_FACTOR, THICKNESS, HEIGHT]);
		}

		// Cut the hole to drill through
		translate([HOFFSET+THICKNESS+HOLE_RADIUS,YOFFSET+THICKNESS++HOLE_RADIUS,0])
		drawCylinder(HEIGHT, HOLE_RADIUS);
	}
}

module drawPrintableHandleJigRight()
{
	mirror([1,0,0])
	drawHandleJig();
}

module drawPrintableHandleJigLeft()
{
	drawHandleJig();
}

module drawPrintableHandleJigs()
{
	drawPrintableHandleJigRight();
	translate([5,0,0])
	drawPrintableHandleJigLeft();
}

/*
module drawGlyphRod(x1, y1, x2, y2, scale)
{
	xslope=x1/x2;
	yslope=y1/y2;
	length=sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
	rotate([xslope, 90, yslope])
	drawCylinder(x1*scale, 
}

module drawR(scale)
{
}
*/

//drawHandleJig();
//drawPrintableHandleJigLeft();
//drawPrintableHandleJigRight();
drawPrintableHandleJigs();
drawBuildArea();
