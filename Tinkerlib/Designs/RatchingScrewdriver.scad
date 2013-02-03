
RATCHET_STYLE_TRIANGLE=0;
RATCHET_STYLE_SQUARE=1;

RATCHET_DATA_RADIUS=0;
RATCHET_DATA_HUB_RADIUS=1;
RATCHET_DATA_PRAWL_LENGTH=2;
RATCHET_DATA_PRAWL_WIDTH=3;
RATCHET_DATA_PRAWL_ANGLE=4;
RATCHET_DATA_HEIGHT=5;
RATCHET_DATA_HUB_TOOTH_ANGLE=6;
RATCHET_DATA_HUB_TOOTH_WIDTH=7;
RATCHET_DATA_PRAWL_THICKNESS=8;
RATCHET_DATA_PRAWL_COUNT=9;
RATCHET_DATA_STYLE=10;
RATCHET_DATA_HUB_TOOTH_LENGTH=11;
RATCHET_DATA_OUTER_THICKNESS=12;
RATCHET_DATA_GAP=13;


SCREWDRIVER_RATCHET_DATA=[
	40,		/* RADIUS */
	5,		/* HUB_RADIUS */
	40*.8,	/* PRAWL_LENGTH */
	2,		/* PRAWL_WIDTH */
	30,		/* PRAWL_ANGLE */
	3,		/* HEIGHT */
	30,		/* HUB_TOOTH_ANGLE */
	2,		/* HUB_TOOTH_WIDTH */
	5,		/* PRAWL_THICKNESS */
	10,		/* PRAWL_COUNT */
	RATCHET_STYLE_SQUARE,
	5,		/* RATCHET_DATA_HUB_TOOTH_LENGTH */
	3,		/* RATCHET_DATA_OUTER_THICKNESS */
	0.5,		/* RATCHET_DATA_GAP */
];


//SCREWDRIVER_BIT_HOLDER
//BIT_DATA



DETAIL=30;
FAST=1;

include <TinkerLib.scad>;


module echoRatchetData(data)
{
	echo("Radius");
	echo(data[RATCHET_DATA_RADIUS]);
	echo("Hub Radius");
	echo(data[RATCHET_DATA_HUB_RADIUS]);
	echo("Prawl length");
	echo(data[RATCHET_DATA_PRAWL_LENGTH]);
	echo("Prawl width");
	echo(data[RATCHET_DATA_PRAWL_WIDTH]);
	echo("Prawl angle");
	echo(data[RATCHET_DATA_PRAWL_ANGLE]);
	echo("Height");
	echo(data[RATCHET_DATA_HEIGHT]);
	echo("Tooth angle");
	echo(data[RATCHET_DATA_HUB_TOOTH_ANGLE]);
	echo("Tooth width");
	echo(data[RATCHET_DATA_HUB_TOOTH_WIDTH]);
	echo("Prawl thickness");
	echo(data[RATCHET_DATA_PRAWL_THICKNESS]);
	echo("Prawl count");
	echo(data[RATCHET_DATA_PRAWL_COUNT]);
	echo("Style");
	echo(data[RATCHET_DATA_STYLE]);
	echo("Hub tooth length");
	echo(data[RATCHET_DATA_HUB_TOOTH_LENGTH]);
	echo("Outer thickness");
	echo(data[RATCHET_DATA_OUTER_THICKNESS]);
	echo("Gap");
	echo(data[RATCHET_DATA_GAP]);
}


module drawRatchetInnerTooth(data)
{
	if ( data[RATCHET_DATA_STYLE] == RATCHET_STYLE_SQUARE )
	{
		rotate([0,0,data[RATCHET_DATA_HUB_TOOTH_ANGLE]])
		cube([data[RATCHET_DATA_HUB_TOOTH_WIDTH], data[RATCHET_DATA_HUB_TOOTH_LENGTH], data[RATCHET_DATA_HEIGHT]]);
	}
}

module drawRatchetOuterFinger(data)
{
	cube([data[RATCHET_DATA_PRAWL_WIDTH], data[RATCHET_DATA_PRAWL_LENGTH], data[RATCHET_DATA_HEIGHT]]);
}

module drawInnerRatchet(data)
{
	// Draw the inner hub
	cylinder(data[RATCHET_DATA_HEIGHT], data[RATCHET_DATA_HUB_RADIUS], data[RATCHET_DATA_HUB_RADIUS], $fn=DETAIL);
	
	// Draw inner finger grabbers
	for ( i = [ 0 : data[RATCHET_DATA_PRAWL_COUNT]-1 ] )
	{
		rotate([0,0,(360/data[RATCHET_DATA_PRAWL_COUNT])*i])
		translate([0,data[RATCHET_DATA_RADIUS]*0.07,0])
		rotate([0,0,0])
		drawRatchetInnerTooth(data);
	}
}

module drawBitHolder(data, bitInfo)
{
	// Draw a lip for the finger assembly to sit on
//	translate([0,0,3*data[RATCHET_DATA_HEIGHT]])
	cylinder(data[RATCHET_DATA_HEIGHT], data[RATCHET_DATA_RADIUS]-data[RATCHET_DATA_GAP], data[RATCHET_DATA_RADIUS]-data[RATCHET_DATA_GAP], $fn=DETAIL);
}

module drawHandlePart1(data)
{
	// Draw the outer tube
	drawTube(data[RATCHET_DATA_HEIGHT]*6, data[RATCHET_DATA_RADIUS]+data[RATCHET_DATA_OUTER_THICKNESS], data[RATCHET_DATA_RADIUS]+data[RATCHET_DATA_GAP]);

	// Draw the top of the ratchet finger holder
	translate([0,0,5*data[RATCHET_DATA_HEIGHT]])
	cylinder(data[RATCHET_DATA_HEIGHT], data[RATCHET_DATA_RADIUS]+data[RATCHET_DATA_OUTER_THICKNESS], data[RATCHET_DATA_RADIUS]+data[RATCHET_DATA_OUTER_THICKNESS], center=false, $fn=DETAIL);

	// Draw a lip for the finger assembly to sit on
	translate([0,0,3*data[RATCHET_DATA_HEIGHT]])
	drawTube(data[RATCHET_DATA_HEIGHT], data[RATCHET_DATA_RADIUS]-data[RATCHET_DATA_GAP], data[RATCHET_DATA_RADIUS]-data[RATCHET_DATA_PRAWL_THICKNESS]-data[RATCHET_DATA_GAP]);

	// Draw a ring to support the finger assembly to reduce stress
	translate([0,0,3*data[RATCHET_DATA_HEIGHT]])
	drawTube(data[RATCHET_DATA_HEIGHT], data[RATCHET_DATA_RADIUS]/2, data[RATCHET_DATA_RADIUS]/2-data[RATCHET_DATA_PRAWL_THICKNESS]);

}

module drawHandlePart2(data)
{
	// Draw the outer tube
	drawTube(data[RATCHET_DATA_HEIGHT], data[RATCHET_DATA_RADIUS], data[RATCHET_DATA_RADIUS]-data[RATCHET_DATA_PRAWL_THICKNESS]);

	// Draw outer fingers
	rotate([0,0,-12])
	for ( i = [ 0 : data[RATCHET_DATA_PRAWL_COUNT]-1 ] )
	{
		rotate([0,0,(360/data[RATCHET_DATA_PRAWL_COUNT])*i])
		translate([0,data[RATCHET_DATA_RADIUS]*0.18,0])
		rotate([0,0,data[RATCHET_DATA_PRAWL_ANGLE]])
		drawRatchetOuterFinger(data);
	}
}

module drawScrewdriver(data)
{
	echoRatchetData(data);
	drawHandlePart1(data);

	translate([0,0,-10])
	drawHandlePart2(data);

	translate([0,0,-40])
	{
		drawBitHolder(data, []);
		translate([0,0,data[RATCHET_DATA_HEIGHT]])
		drawInnerRatchet(data);
	}
}

module drawPrintable()
{
	drawScrewdriver(SCREWDRIVER_RATCHET_DATA);
}

drawScrewdriver(SCREWDRIVER_RATCHET_DATA);
