
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

MINIFOLD_INPUT_RADIUS=0;
MINIFOLD_OUTPUT_RADIUS=1;
MINIFOLD_OUTPUT_COUNT=2;
MINIFOLD_INPUT_PORT_DEPTH=3;
MINIFOLD_OUTPUT_PORT_DEPTH=4;

AIR_MANIFOLD_TEST1=[
	10,		/* MINIFOLD_INPUT_RADIUS */
	5,		/* MINIFOLD_OUTPUT_RADIUS */
	6,		/* MINIFOLD_OUTPUT_COUNT */
	20,		/* MINIFOLD_INPUT_PORT_DEPTH */
	20,		/* MINIFOLD_OUTPUT_PORT_DEPTH */
];

module drawManifold(inputRadius, outputRadius, outputCount, portDepth)
{
	translate([0,-1*(outputRadius*1.5)*(outputCount-1),0])
	{
	translate([0,(outputRadius*1.5)*(outputCount-1),0])
	rotate([0,-90,0])
	drawCylinderTransition(portDepth*3, outputRadius, inputRadius, portDepth);

	for ( x = [ 0 : outputCount-1 ] )
	{
		translate([0,outputRadius*x*3,0])
		drawSphere(outputRadius);
		translate([0,outputRadius*x*3,0])
		rotate([0,90,0])
		drawCylinder(portDepth*2, outputRadius);
	}

	rotate([-90,0,0])
	drawCylinder((outputRadius*1.5)*(outputCount-1)*2, outputRadius);
	}
}

module drawManifoldTube(inputRadius, outputRadius, outputCount, portDepth, tubeThickness)
{
	difference()
	{
		drawManifold(inputRadius, outputRadius, outputCount, portDepth);
		drawManifold(inputRadius-tubeThickness, outputRadius-tubeThickness, outputCount, portDepth);
	}
}

//drawBandsawPort();

drawManifold(10, 5, 6, 20);

//drawManifoldTube(10, 5, 6, 20, 1.5);

//drawLinkedCylinders(20, 30, 45, 5 );
//drawLinkedTubes(20, 30, 15, 5, 4 );
//drawLinkedRods(20, 30, 45, 5 );

//drawLinkedCylinderGroup(30, [30,50,30], [-65,0,90], 5);

//drawCylinderTransition(40, 5, 10,5);
//translate([25,0,0])
//drawConeTransition(40, 5, 10, 5);
