
/********************************************************************
 * TinkerLib : Rocket fins
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=120;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

FIN_TUBE_INNER_RADIUS=0;
FIN_TUBE_THICKNESS=1;
FIN_BOTTOM_RADIUS=2;
FIN_TOP_RADIUS=3;
FIN_LENGTH=4;
FIN_THICKNESS=5;
FIN_TWIST=6;
FIN_COUNT=7;
FIN_TUBE_LENGTH=8;


TEST_FINS_1=[
	20,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	22,			/* FIN_TOP_RADIUS */
	60,			/* FIN_LENGTH */
	3,			/* FIN_THICKNESS */
	60,			/* FIN_TWIST */
	18,			/* FIN_COUNT */
	60,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_2=[
	20,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	22,			/* FIN_TOP_RADIUS */
	60,			/* FIN_LENGTH */
	3,			/* FIN_THICKNESS */
	60,			/* FIN_TWIST */
	3,			/* FIN_COUNT */
	60,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_3=[
	20,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	22,			/* FIN_TOP_RADIUS */
	60,			/* FIN_LENGTH */
	3,			/* FIN_THICKNESS */
	0,			/* FIN_TWIST */
	4,			/* FIN_COUNT */
	60,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_4=[
	20,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	22,			/* FIN_TOP_RADIUS */
	60,			/* FIN_LENGTH */
	3,			/* FIN_THICKNESS */
	60,			/* FIN_TWIST */
	4,			/* FIN_COUNT */
	60,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_5=[
	20,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	22,			/* FIN_TOP_RADIUS */
	60,			/* FIN_LENGTH */
	3,			/* FIN_THICKNESS */
	-60,		/* FIN_TWIST */
	4,			/* FIN_COUNT */
	60,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_6=[
	5,			/* FIN_TUBE_INNER_RADIUS */
	20,			/* FIN_TUBE_THICKNESS */
	30,			/* FIN_BOTTOM_RADIUS */
	30,			/* FIN_TOP_RADIUS */
	20,			/* FIN_LENGTH */
	2,			/* FIN_THICKNESS */
	0,			/* FIN_TWIST */
	20,			/* FIN_COUNT */
	20,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_7=[
	5,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	10,			/* FIN_TOP_RADIUS */
	20,			/* FIN_LENGTH */
	2,			/* FIN_THICKNESS */
	90,			/* FIN_TWIST */
	4,			/* FIN_COUNT */
	20,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_8=[
	5,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	45,			/* FIN_TOP_RADIUS */
	80,			/* FIN_LENGTH */
	2,			/* FIN_THICKNESS */
	360*4,			/* FIN_TWIST */
	1,			/* FIN_COUNT */
	80,			/* FIN_TUBE_LENGTH */
];

TEST_FINS_9=[
	0,			/* FIN_TUBE_INNER_RADIUS */
	2,			/* FIN_TUBE_THICKNESS */
	45,			/* FIN_BOTTOM_RADIUS */
	0,			/* FIN_TOP_RADIUS */
	60,			/* FIN_LENGTH */
	3,			/* FIN_THICKNESS */
	60,			/* FIN_TWIST */
	18,			/* FIN_COUNT */
	60,			/* FIN_TUBE_LENGTH */
];


module drawFinsTube(data)
{
	drawTube(data[FIN_TUBE_LENGTH],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]);
}

module drawFin(data)
{
	linear_extrude(height = data[FIN_LENGTH], center = false,
		convexity = 10, twist=data[FIN_TWIST], slices = DETAIL)
	translate([data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]-DIFFERENCE_FUDGE-0.33, data[FIN_THICKNESS]/-2, 0])
	square([data[FIN_BOTTOM_RADIUS],data[FIN_THICKNESS]]);
}

module drawFins(data)
{
	drawFinsTube(data);

	intersection()
	{
		union()
		{
			for ( i = [ 0 : data[FIN_COUNT]-1 ] )
			{
				rotate([0,0,360/data[FIN_COUNT]*i]) 
				drawFin(data);
			}
		}

		cylinder(h=data[FIN_LENGTH],
			r1=data[FIN_BOTTOM_RADIUS],
			r2=data[FIN_TOP_RADIUS],
			center=false);
	}
}

module drawFinGallery()
{
	drawFins(TEST_FINS_1);
	translate([100,0,0])
	drawFins(TEST_FINS_2);
	translate([200,0,0])
	drawFins(TEST_FINS_3);

	translate([0,100,0])
	drawFins(TEST_FINS_4);
	translate([100,100,0])
	drawFins(TEST_FINS_5);
	translate([200,100,0])
	drawFins(TEST_FINS_6);

	translate([0,200,0])
	drawFins(TEST_FINS_7);
	translate([100,200,0])
	drawFins(TEST_FINS_8);
	translate([200,200,0])
	drawFins(TEST_FINS_9);
}

drawFinGallery();
