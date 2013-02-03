
DETAIL=60;
FAST=1;

include <TinkerLib.scad>;


module drawCandleHolderOrig()
{
	difference()
	{
		drawDoubleFlairedCylinder( 15, 7, 10, 10, 25, 10 );
		
		translate([0,0,-8])
		cylinder(16, 7, 8.5);
	}
}

rotate([0,180,0])
drawCandleHolderOrig();
