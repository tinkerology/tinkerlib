
DETAIL=120;
FAST=0;

include <..\Tinkerlib\TinkerLib.scad>;

module drawBase()
{
	difference()
	{
		union()
		{
			// Draw base
			translate([0,-20,0])
			drawCylinderDifference(20, 50, 70, [30,-30,0]);

			translate([0,20,0])
			drawCylinderDifference(20, 50, 70, [30,30,0]);
		}

		// Sculpt it down
		translate([-5,50,65])
		rotate([90,0,0])
		cylinder(100,60,60,$fn=DETAIL);

		// Make a goove for the bottom of the device
		translate([-34,50,15])
		rotate([90,0,0])
		cylinder(100,6,6,$fn=DETAIL);

	}
}

module drawUprightSide()
{
	translate([-16,30,39])
	rotate([0,110,0])
	drawCylinderDifference(5, 50, 70, [5,30,0]);
}

module drawUpright()
{
	drawUprightSide();
	mirror([0,1,0])
	drawUprightSide();
}

drawBase();
drawUpright();
//drawRuler(120, 20);
