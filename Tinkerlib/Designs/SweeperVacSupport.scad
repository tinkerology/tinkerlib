
ROUNDOVER=1;
SUPPORT_RADIUS=8.1;
SUPPORT_HEIGHT=14;
HANGER_WIDTH=34;
HANGER_DEPTH=16;
HANGER_THICKNESS=4;
SCREW_RADIUS=1;
SCREW_COUNTERSINK_LENGTH=4;
SCREW_COUNTERSINK_RADIUS=2;

DETAIL=30;
FAST=0;

include <TinkerLib.scad>;

module drawSaddle()
{
	difference()
	{
		drawRoundedCube([SUPPORT_RADIUS*5,SUPPORT_RADIUS*4,SUPPORT_HEIGHT], ROUNDOVER);

		// Take out the center support hole
		translate([0,0,-1 * SUPPORT_HEIGHT/2])
		cylinder(SUPPORT_HEIGHT+0.01, SUPPORT_RADIUS, SUPPORT_RADIUS, $fn=DETAIL);

		// Make screw holes
		translate([SUPPORT_RADIUS*1.75,SUPPORT_RADIUS*2+0.01,0])
		rotate([90,0,0])
		drawRecessedBoltHole(20, M4_BOLT_DATA, 5 );

		translate([-1*SUPPORT_RADIUS*1.75,SUPPORT_RADIUS*2+0.01,0])
		rotate([90,0,0])
		drawRecessedBoltHole(20, M4_BOLT_DATA, 5 );
		
		// Break into two pieces
		cube([SUPPORT_RADIUS*6,0.5,SUPPORT_HEIGHT], center=true);
	}
}

module drawHanger()
{
	translate([0, -1*SUPPORT_RADIUS*3.5, 0])
	difference()
	{
		drawRoundedCube([HANGER_WIDTH+2*HANGER_THICKNESS, HANGER_DEPTH+2*HANGER_THICKNESS, SUPPORT_HEIGHT], ROUNDOVER);
//		cube([HANGER_WIDTH+2*HANGER_THICKNESS, HANGER_DEPTH+2*HANGER_THICKNESS, SUPPORT_HEIGHT], center=true);

		cube([HANGER_WIDTH, HANGER_DEPTH+0.01, SUPPORT_HEIGHT], center=true);
	}
}

module drawNozzleSupport()
{
	drawSaddle();
	drawHanger();
}

module drawPrintable()
{
	drawNozzleSupport();
}

drawNozzleSupport();
