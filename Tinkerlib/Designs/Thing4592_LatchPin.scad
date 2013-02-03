
module drawLatchPinAndSpring()
{
	cube([48,3,6]);

	difference()
	{
		color("blue")
		rotate(-90)
		cube([35,3,6]);

		color("green")
		rotate(-90)
		translate([35,-8,0])
		rotate(45)
		cube([8,8,8]);
	}
}

drawLatchPinAndSpring();