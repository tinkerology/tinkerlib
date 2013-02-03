
DETAIL=30;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

SUPPORT_SIGN_THICKNESS=0;
SUPPORT_LENGTH_FRONT=1;
SUPPORT_LENGTH_BACK=2;
SUPPORT_WIDTH=3;
SUPPORT_HEIGHT=4;
SUPPORT_GROOVE_HEIGHT=5;
SUPPORT_GROOVE_ANGLE=6;
SUPPORT_GROOVE_LENGTH=7;

RIALTA_SIGN_DATA_SMALL=[
	3.5,		/* SUPPORT_SIGN_THICKNESS */
	0,			/* SUPPORT_LENGTH_FRONT */
	20,			/* SUPPORT_LENGTH_BACK */
	10,			/* SUPPORT_WIDTH */
	4,			/* SUPPORT_HEIGHT */
	7,			/* SUPPORT_GROOVE_HEIGHT */
	10,			/* SUPPORT_GROOVE_ANGLE */
	8			/* SUPPORT_GROOVE_LENGTH */
];

RIALTA_SIGN_DATA=[
	3.5,		/* SUPPORT_SIGN_THICKNESS */
	0,			/* SUPPORT_LENGTH_FRONT */
	40,			/* SUPPORT_LENGTH_BACK */
	10,			/* SUPPORT_WIDTH */
	4,			/* SUPPORT_HEIGHT */
	7,			/* SUPPORT_GROOVE_HEIGHT */
	12.5,			/* SUPPORT_GROOVE_ANGLE */
	8			/* SUPPORT_GROOVE_LENGTH */
];

module drawBase(supportData)
{
	// Draw base
	cube([
		supportData[SUPPORT_LENGTH_FRONT]+
			supportData[SUPPORT_LENGTH_BACK],
		supportData[SUPPORT_WIDTH],
		supportData[SUPPORT_HEIGHT],
		]);

	// Draw support for sign groove
	translate([
		supportData[SUPPORT_LENGTH_FRONT],
		0,
		supportData[SUPPORT_HEIGHT]
		])
	cube([
		supportData[SUPPORT_GROOVE_LENGTH],
		supportData[SUPPORT_WIDTH],
		supportData[SUPPORT_GROOVE_HEIGHT],
		]);
}

module drawGroove(supportData)
{
	// Draw support for sign groove
	translate([
		supportData[SUPPORT_LENGTH_FRONT]+
			(supportData[SUPPORT_GROOVE_LENGTH]-
			 supportData[SUPPORT_SIGN_THICKNESS])/2,
		0,
		supportData[SUPPORT_HEIGHT]
		])
	rotate([0,supportData[SUPPORT_GROOVE_ANGLE],0])
	cube([
		supportData[SUPPORT_SIGN_THICKNESS],
		supportData[SUPPORT_WIDTH],
		supportData[SUPPORT_GROOVE_HEIGHT]*2,
		]);
}

module drawSignStandInternal(supportData)
{
	difference()
	{
		drawBase(supportData);

		drawGroove(supportData);
	}
}

module drawSignStand(supportData)
{
	if ( FAST == 1 )
	{
		drawSignStandInternal(supportData);
	}
	else
	{
		minkowski()
		{
			drawSignStandInternal(supportData);

			sphere(r=0.5,$fn=DETAIL);
		}
	}
}

module drawPlateOfSignStands(data, xCount, yCount)
{
	drawBuildArea();

	xSpacing = data[SUPPORT_LENGTH_FRONT] + data[SUPPORT_LENGTH_BACK] * 1.1;
	ySpacing = data[SUPPORT_WIDTH] * 1.1;

	for ( x = [ 0 : xCount-1 ] )
	{
		for ( y= [ 0 : yCount-1 ] )
		{
			translate([x*xSpacing, y*ySpacing, 0])
			drawSignStand( data );
		}
	}

}

drawPlateOfSignStands(RIALTA_SIGN_DATA,2,3);
//drawSignStand(RIALTA_SIGN_DATA);
