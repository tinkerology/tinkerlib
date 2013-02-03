DETAIL=30;
FAST=1;

RADIUS=19;
SUPPORT_WIDTH=16;
SUPPORT_THICKNESS=18;
WALL_THICKNESS=2;
NUB_THICKNESS=2;
INNER_RADIUS=RADIUS-WALL_THICKNESS;
SUPPORT_HEIGHT=20;
CHAMFER=.5;

include <TinkerLib.scad>;

module drawFlashlightBracket()
{
	translate([RADIUS,0,0])
	drawTube(10,RADIUS,INNER_RADIUS);

	translate([-1*SUPPORT_THICKNESS,-1*(SUPPORT_WIDTH/2),0])
	drawChamferedCube([SUPPORT_THICKNESS+2,SUPPORT_WIDTH,2], CHAMFER);

	translate([-1*SUPPORT_THICKNESS,-1*(SUPPORT_WIDTH/2),0])
	drawChamferedCube([2,SUPPORT_WIDTH,SUPPORT_HEIGHT], CHAMFER);

	translate([0,-1*(SUPPORT_WIDTH/2),0])
	drawChamferedCube([2,SUPPORT_WIDTH,SUPPORT_HEIGHT], CHAMFER);

	translate([RADIUS,0,0])
	drawRadialCylinders( 10,
		INNER_RADIUS,
		NUB_THICKNESS, NUB_THICKNESS,
		SUPPORT_HEIGHT );

//	translate([4,0,0])
//	cube([30,30,30]);
}

drawFlashlightBracket();
