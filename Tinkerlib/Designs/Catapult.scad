
/**
 * Inspired by http://www.thingiverse.com/thing:11910
 **/

BASE_WIDTH=23;
BASE_LENGTH=48;
BASE_THICKNESS=2.75;

ARM_WIDTH=16;
ARM_LENGTH=80;
ARM_THICKNESS=2;

HOLE_RADIUS=ARM_WIDTH*0.4;

module drawBaseBottom()
{
	cube([BASE_WIDTH,BASE_LENGTH,BASE_THICKNESS]);
	translate([0,0,BASE_THICKNESS])
	cube([BASE_WIDTH,BASE_WIDTH/2,BASE_THICKNESS]);
}

module drawBase()
{
	difference()
	{
		drawBaseBottom();

		translate( [BASE_WIDTH/4,BASE_WIDTH/2,0] )
		rotate( [0,0,45] )
		% cube( [ARM_WIDTH, BASE_THICKNESS*3, ARM_THICKNESS ] );
	}
}

module drawArm()
{
	difference()
	{
		cube([ARM_WIDTH,ARM_LENGTH,ARM_THICKNESS]);

		translate( [ARM_WIDTH/2,ARM_LENGTH*0.8-HOLE_RADIUS,0])
		% cylinder( ARM_THICKNESS*2, HOLE_RADIUS, HOLE_RADIUS  );
	}
}

drawBase();
translate([BASE_WIDTH*1.25,0,0])
drawArm();