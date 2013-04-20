
/********************************************************************
 * TinkerLib : Shop vacuum dust port for a tool like a bandsaw
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=30;
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

MANIFOLD_INPUT_RADIUS=0;
MANIFOLD_OUTPUT_RADIUS=1;
MANIFOLD_INPUT_COUNT=2;
MANIFOLD_OUTPUT_COUNT=3;
MANIFOLD_INPUT_PORT_DEPTH=4;
MANIFOLD_OUTPUT_PORT_DEPTH=5;
MANIFOLD_INPUT_PORT_OFFSET=6;
MANIFOLD_OUTPUT_PORT_OFFSET=7;
MANIFOLD_WALL_THICKNESS=8;

AIR_MANIFOLD_TEST1=[
	MM_PER_INCH*(5/8)/2,		/* MANIFOLD_INPUT_RADIUS */
	(MM_PER_INCH/4)/2,		/* MANIFOLD_OUTPUT_RADIUS */
	2,						/* MANIFOLD_INPUT_COUNT */
	4,						/* MANIFOLD_OUTPUT_COUNT */
	20,						/* MANIFOLD_INPUT_PORT_DEPTH */
	20,						/* MANIFOLD_OUTPUT_PORT_DEPTH */
	20,						/* MANIFOLD_INPUT_PORT_OFFSET */
	10,						/* MANIFOLD_OUTPUT_PORT_OFFSET */
	1.5,					/* MANIFOLD_WALL_THICKNESS */
];

AIR_MANIFOLD_TEST2=[
	(MM_PER_INCH*(5/8)/2)-1.5,	/* MANIFOLD_INPUT_RADIUS */
	((MM_PER_INCH/4)/2)-1.5,		/* MANIFOLD_OUTPUT_RADIUS */
	2,						/* MANIFOLD_INPUT_COUNT */
	4,						/* MANIFOLD_OUTPUT_COUNT */
	20,						/* MANIFOLD_INPUT_PORT_DEPTH */
	20,						/* MANIFOLD_OUTPUT_PORT_DEPTH */
	20+3,					/* MANIFOLD_INPUT_PORT_OFFSET */
	10+3,					/* MANIFOLD_OUTPUT_PORT_OFFSET */
	1.5,					/* MANIFOLD_WALL_THICKNESS */
];


module drawManifoldData(data)
{
	translate([0,
		-1*(data[MANIFOLD_OUTPUT_RADIUS]*2*data[MANIFOLD_OUTPUT_COUNT]+
			data[MANIFOLD_OUTPUT_PORT_OFFSET]*(data[MANIFOLD_OUTPUT_COUNT]-1)),0])
	{
	// Draw the input ports
	for ( x = [ 0 : data[MANIFOLD_INPUT_COUNT]-1 ] )
	{
		translate([0,data[MANIFOLD_INPUT_RADIUS]*2*x+
					  data[MANIFOLD_INPUT_PORT_OFFSET]*x,0])
		rotate([0,-90,0])
		drawCylinderTransition(data[MANIFOLD_INPUT_PORT_DEPTH]*3,
			data[MANIFOLD_OUTPUT_RADIUS],
			data[MANIFOLD_INPUT_RADIUS],
			data[MANIFOLD_INPUT_PORT_DEPTH]);
	}

	// Draw the output ports
	for ( x = [ 0 : data[MANIFOLD_OUTPUT_COUNT]-1 ] )
	{
		translate([0,
		(data[MANIFOLD_OUTPUT_RADIUS]*2+data[MANIFOLD_OUTPUT_PORT_OFFSET])*x,0])
		drawSphere(data[MANIFOLD_OUTPUT_RADIUS]);
		translate([0,
		(data[MANIFOLD_OUTPUT_RADIUS]*2+data[MANIFOLD_OUTPUT_PORT_OFFSET])*x,0])
		rotate([0,90,0])
		drawCylinder(data[MANIFOLD_OUTPUT_PORT_DEPTH], data[MANIFOLD_OUTPUT_RADIUS]);
	}

	// Draw the cross duct
	rotate([-90,0,0])
	drawCylinder(data[MANIFOLD_OUTPUT_RADIUS]*2*data[MANIFOLD_OUTPUT_COUNT]+
		data[MANIFOLD_OUTPUT_PORT_OFFSET]*(data[MANIFOLD_OUTPUT_COUNT]-1)-
		data[MANIFOLD_OUTPUT_RADIUS]*2,
		data[MANIFOLD_OUTPUT_RADIUS]);
	}
}

module drawManifoldTubeData(data,data2)
{
	difference()
	{
		drawManifoldData(data);

		translate([0,-3,0])
		drawManifoldData(data2);
	}
}

module drawManifold(inputRadius, outputRadius, inputCount, outputCount, portDepth)
{
	translate([0,-1*(outputRadius*1.5)*(outputCount-1),0])
	{
	for ( x = [ 0 : inputCount-1 ] )
	{
		translate([0,(inputRadius*2.5)*x*(inputCount-1),0])
		rotate([0,-90,0])
		drawCylinderTransition(portDepth*3, outputRadius,
			inputRadius, portDepth);
	}

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

module drawDustCollectionManifold()
{
	difference()
	{
		translate([-56,-105,-20])
		drawChamferedCube([50,105,50],1);

		drawManifoldData(AIR_MANIFOLD_TEST1);
		
		translate([-60,-50,125])
		rotate([0,90,0])
		scale([1,1.5,1])
		drawCylinder(100,100);
	}
}
//drawDustCollectionManifold();

drawManifoldData(AIR_MANIFOLD_TEST1);
//drawManifoldTubeData(AIR_MANIFOLD_TEST1,AIR_MANIFOLD_TEST2);

//drawBandsawPort();



//drawLinkedCylinders(20, 30, 45, 5 );
//drawLinkedTubes(20, 30, 15, 5, 4 );
//drawLinkedRods(20, 30, 45, 5 );

//drawLinkedCylinderGroup(30, [30,50,30], [-65,0,90], 5);

//drawCylinderTransition(40, 5, 10,5);
//translate([25,0,0])
//drawConeTransition(40, 5, 10, 5);
