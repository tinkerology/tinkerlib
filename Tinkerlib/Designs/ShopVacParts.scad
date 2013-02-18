
/********************************************************************
 * TinkerLib : Shop vacuum dust port for a tool like a bandsaw
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=120;
FAST=0;

include <..\Tinkerlib\TinkerLib.scad>;

PORT_RADIUS=((MM_PER_INCH*2.25)/2) + 1;
SUPPORT_RADIUS=PORT_RADIUS+2.5;
FLANG_RADIUS=(SUPPORT_RADIUS+59)/2;
SCREW_RADIUS=5/2;

BANDSAW_PORT=[
	16,							/* BUSHING_LENGTH */
	PORT_RADIUS,				/* BUSHING_INNER_RADIUS */
	SUPPORT_RADIUS,			/* BUSHING_OUTER_RADIUS */
	FLANG_RADIUS,				/* BUSHING_SHOULDER_RADIUS */
	3,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_SOLID,	/* BUSHING_FILL_STYLE */
	0,							/* BUSHING_FILL_ANGLE */
	0,							/* BUSHING_FILL_SIZE */
	0,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	3,							/* BUSHING_SHOULDER_HOLE_COUNT */
	SCREW_RADIUS,				/* BUSHING_SHOULDER_HOLE_RADIUS */
	[0,0,0]						/* BUSHING_HOLE_OFFSET */
];

module drawBandsawPort()
{
	drawBushing( BANDSAW_PORT );

// Ruler test
//	translate([0,0,-2.5])
//	cube([PORT_RADIUS*2,2,5], center=true);
}

drawBandsawPort();
