
/********************************************************************
 * TinkerLib : Test code (incomplete)
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=24;

module rounded_cube( width, depth, h, roundover)
{
	width = width-roundover*2;
	depth = depth - roundover*2;

	translate([roundover, roundover,0])
	linear_extrude(height=h, true)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([width,0,0])
	linear_extrude(height=h, true)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([width,depth,0])
	linear_extrude(height=h)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([0,depth,0])
	linear_extrude(height=h)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([-1*roundover,0,0])
	cube([width+roundover*2,depth,h]);

	translate([roundover, roundover,0])
	translate([0,-1*roundover,0])
	cube([width,depth+roundover*2,h]);
}

rounded_cube(15, 15, 2, 2);

translate([20,0,0])
cube([15, 15, 2]);

translate([0,20,0])
cube([15, 15, 2]);

difference()
{
	translate([20,20,0])
	rounded_cube(15, 15, 2, 4);

	translate([22.5,22.5,0])
	rounded_cube(10, 10, 2, 4);

}