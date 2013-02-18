
/********************************************************************
 * TinkerLib : Toilet Lid Hinge
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=120;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

SCREW_HOLE_SPACING=0;
BASE_WIDTH=1;
BASE_LENGTH=2;
PIVOT_HOLE_OFFSET=3;
PIVOT_HOLE_RADIUS=4;
PIVOT_HOLE_RISE=5;
PIVOT_HOLE_DEPTH=6;
SCREW_HOLE_RADIUS=7;
BASE_DEPTH=8;

AMERICAN_STAMDARD=[
	23,			/* SCREW_HOLE_SPACING */
	16,			/* BASE_WIDTH */
	51,			/* BASE_LENGTH */
	20,			/* PIVOT_HOLE_OFFSET */
	6,			/* PIVOT_HOLE_RADIUS */
	16,			/* PIVOT_HOLE_RISE */
	11,			/* PIVOT_HOLE_DEPTH */
	4.25,		/* SCREW_HOLE_RADIUS */
	7,			/* BASE_DEPTH */
];


module drawScrewHole(data)
{
	drawCylinder(data[BASE_DEPTH/2], data[SCREW_HOLE_RADIUS]/2);
	translate([0,0,data[BASE_DEPTH]/2])
	drawCylinder(data[BASE_DEPTH/2], data[SCREW_HOLE_RADIUS]);
}

module drawBase(data)
{
	difference()
	{
		drawChamferedCube([data[BASE_LENGTH],data[BASE_WIDTH],data[BASE_DEPTH]],1.0);

		translate([(data[BASE_LENGTH]-data[SCREW_HOLE_SPACING])/2,0,0])
		{
			translate([0,data[BASE_WIDTH]/2,0])
			drawScrewHole(data);
			translate([data[SCREW_HOLE_SPACING],data[BASE_WIDTH]/2,0])
			drawScrewHole(data);
		}
	}
}


module drawPivot(data)
{
	difference()
	{
		translate([data[PIVOT_HOLE_OFFSET]*-1,0,data[PIVOT_HOLE_RISE]])
		rotate([-90,0,0])
		difference()
		{
			drawCylinder(data[BASE_WIDTH],data[PIVOT_HOLE_RADIUS]*1.5);
			drawCylinder(data[PIVOT_HOLE_DEPTH],data[PIVOT_HOLE_RADIUS]);
		}
	}

	// FIX ALL THIS CRAP
	difference()
	{
		color("blue")
		translate([4,0,data[BASE_DEPTH]-0.5])
		rotate([0,-160,0])
		drawChamferedCube([data[PIVOT_HOLE_OFFSET]*1.1,data[BASE_WIDTH],data[BASE_DEPTH]],1.0);

		translate([data[PIVOT_HOLE_OFFSET]*-1,-1*DIFFERENCE_FUDGE,data[PIVOT_HOLE_RISE]])
		rotate([-90,0,0])
		drawCylinder(data[PIVOT_HOLE_DEPTH],data[PIVOT_HOLE_RADIUS]);

	}
}

module drawToiletLidHinge(data)
{
	drawBase(data);
	drawPivot(data);
}

module drawPrintableToiletLidHinge(data)
{
	translate([0,0,data[BASE_WIDTH]])
	rotate([-90,0,0])
	drawToiletLidHinge(data);
}

module drawPrintableToiletLidHinge_Left(data)
{
	translate([0,0,data[BASE_WIDTH]])
	rotate([-90,0,0])
	mirror([1,0,0])
	drawToiletLidHinge(data);
}

//drawPrintableToiletLidHinge(AMERICAN_STAMDARD);
drawPrintableToiletLidHinge_Left(AMERICAN_STAMDARD);
