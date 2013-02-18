
/********************************************************************
 * TinkerLib : Modified latch pin for Thing #4592 (incomplete)
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

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