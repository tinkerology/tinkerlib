
BODY_SIZE=30;
SCREW_HOLE_RADIUS=1.5;
PENCIL_HOLE_RADIUS=5;
PENCIL_HOLE_OFFSET=10;
ARM_LENGTH=100;
ARM_THICKNESS=3;

DETAIL=30;
FAST=1;

include <TinkerLib.scad>;

module drawBody()
{
	difference()
	{
		union() {
			cube([BODY_SIZE,BODY_SIZE,BODY_SIZE], false);

			// Draw a shoulder on one side in case
			// it is useful
			translate([BODY_SIZE,0,BODY_SIZE/3])
			cube([BODY_SIZE/5,BODY_SIZE,BODY_SIZE/5], false);
		}

		// Draw a hole to tighten the arm
		translate([BODY_SIZE/2,BODY_SIZE/2,0])
		cylinder(BODY_SIZE,
			SCREW_HOLE_RADIUS,
			SCREW_HOLE_RADIUS,
			center=false, $fn=DETAIL);
	}
}

module drawArm()
{
	// Draw arm
	cube([ARM_LENGTH,ARM_THICKNESS*3,ARM_THICKNESS]);
	translate([0,ARM_THICKNESS,ARM_THICKNESS])
	cube([ARM_LENGTH,ARM_THICKNESS,ARM_THICKNESS]);

	// Draw pencil holder
	translate([-1*PENCIL_HOLE_RADIUS,PENCIL_HOLE_RADIUS,0])
	{
		difference()
		{
			drawTube(ARM_THICKNESS*5,
				PENCIL_HOLE_RADIUS*1.5,
				PENCIL_HOLE_RADIUS);

			rotate(0,0,0)
			% cylinder(PENCIL_HOLE_RADIUS,
				 SCREW_HOLE_RADIUS,
				 SCREW_HOLE_RADIUS, center=false, $fn=DETAIL);
		}
	}
}

module drawPrintableMarkingGauge()
{
	drawBuildArea();

	translate([BODY_SIZE,-1*BODY_SIZE,0])
	rotate([0,0,45])
	difference()
	{
		translate([0,BODY_SIZE,0])
		rotate([90,0,0])
		drawBody();

		translate([-1*ARM_LENGTH/2,(BODY_SIZE/2)-ARM_THICKNESS*1.5,BODY_SIZE/2-ARM_THICKNESS*1.5])
		rotate([90,0,0])
		scale([1.05,1.05,1.05])
		drawArm();
	}

	translate([BODY_SIZE/2,-1*BODY_SIZE,0])
	translate([-1*ARM_LENGTH/2,-1*ARM_THICKNESS*5,0])
	rotate([0,0,45])
	drawArm();
}

module drawMarkingGauge()
{
	drawBody();
	translate([-1*ARM_LENGTH/2,(BODY_SIZE/2)-ARM_THICKNESS*1.5,BODY_SIZE/2])
	drawArm();
}

drawMarkingGauge();
//drawPrintableMarkingGauge();
