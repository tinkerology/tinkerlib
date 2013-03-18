
/********************************************************************
 * TinkerLib : Modified latch pin for Thing #4592 (incomplete)
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

THICKNESS=2.5;
SPRING_LENGTH=48;
SPRING_HEIGHT=7;
LATCH_LENGTH=36.5;
OFFSET=8;

module drawLatchPinAndSpring()
{
	cube([SPRING_LENGTH,THICKNESS,SPRING_HEIGHT]);

	difference()
	{
		color("blue")
		rotate(-90)
		cube([LATCH_LENGTH,THICKNESS,SPRING_HEIGHT]);

		color("green")
		rotate(-90)
		translate([LATCH_LENGTH,-OFFSET,0])
		rotate(45)
		cube([OFFSET,OFFSET,OFFSET]);
	}
}

drawLatchPinAndSpring();