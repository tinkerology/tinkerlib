
/********************************************************************
 * TinkerLib : Closet Rod Holder
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *
 * This is a closet rod holder with an offset hole to allow for
 * clothes hangers to have more space above the rod.
 *******************************************************************/

ROD_RADIUS=33/2;
SUPPORT_RADIUS=ROD_RADIUS+4;
FLANG_RADIUS=68/2;
SCREW_RADIUS=5/2;

DETAIL=120;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

CLOSET_ROD_BUSHING=[
	18,							/* BUSHING_LENGTH */
	ROD_RADIUS,					/* BUSHING_INNER_RADIUS */
	SUPPORT_RADIUS,				/* BUSHING_OUTER_RADIUS */
	FLANG_RADIUS,				/* BUSHING_SHOULDER_RADIUS */
	6,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_SOLID,		/* BUSHING_FILL_STYLE */
	0,							/* BUSHING_FILL_ANGLE */
	0,							/* BUSHING_FILL_SIZE */
	0,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	2,							/* BUSHING_SHOULDER_HOLE_COUNT */
	SCREW_RADIUS,				/* BUSHING_SHOULDER_HOLE_RADIUS */
	[0,10,0]					/* BUSHING_HOLE_OFFSET */
];

module drawSupport()
{
	drawBushing( CLOSET_ROD_BUSHING );
}

module drawTestRing()
{
	drawTube(3, SUPPORT_RADIUS, ROD_RADIUS, $fn=DETAIL);
}

//drawTestRing();
drawSupport();
