
DETAIL=30;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

module drawBushing( length, innerRadius, outerRadius, shoulderRadius, shoulderThickness)
{
	drawTube( length, outerRadius, innerRadius );

	translate([0,0,length])
	drawTube( shoulderThickness, shoulderRadius, innerRadius );
}

drawBushing(20, 9/2, 14/2, 20/2, 3);