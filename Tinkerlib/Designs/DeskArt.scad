
/********************************************************************
 * TinkerLib : Spiral cup with a roound base and a lip
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

SIZE=30;
WALL_THICKNESS=2;
HEIGHT=50;
TWIST=180;
DETAIL=60;
ELLIPSE=0.75;
BASE_HEIGHT=5;

linear_extrude(height=HEIGHT, twist=TWIST, slices=DETAIL)
scale([ELLIPSE,1,1])
difference()
{
	circle(r=SIZE, $fn=DETAIL);

	circle(r=SIZE-WALL_THICKNESS, $fn=DETAIL);
}

cylinder(BASE_HEIGHT,SIZE,SIZE);

rotate_extrude(convexity = 10, $fn=DETAIL)
translate([SIZE, BASE_HEIGHT/2, 0])
circle(r = BASE_HEIGHT/2, $fn = DETAIL);

translate([0,0,HEIGHT-WALL_THICKNESS])
scale([ELLIPSE,1,1])
rotate_extrude(convexity = 10, $fn=DETAIL)
translate([SIZE, BASE_HEIGHT/2, 0])
circle(r = BASE_HEIGHT/2, $fn = DETAIL);