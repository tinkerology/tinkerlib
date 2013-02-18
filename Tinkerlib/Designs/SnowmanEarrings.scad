
/********************************************************************
 * TinkerLib : Snowman Earrings (incomplete)
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

FACETS=20;
RADIUS=10;
HAT_SIZE=8;

module drawRoundedCylinder(radius,height,cornerRadius=1,top=true,bottom=true)
{
	// Fill bottom rounded edge
	linear_extrude(cornerRadius*2, true, 10)
	circle(radius-cornerRadius/4);

	// Draw main cylinder
	translate([0,0,0])
	linear_extrude(height-cornerRadius*2, true, 10)
	circle(radius);

	// Draw bottom rounded edge
	rotate_extrude(convexity = 10, $fn=FACETS)
	translate([radius-cornerRadius, 0, 0])
	circle(r = cornerRadius, $fn=FACETS);

	// Draw top rounded edge
	translate([0,0,height+5.25-cornerRadius/4])
	rotate_extrude(convexity = 10, $fn=FACETS)
	translate([radius-cornerRadius, 0, 0])
	circle(r = cornerRadius, $fn=FACETS);
}

module drawHat()
{
	translate([0,0,30])
	cube([HAT_SIZE,HAT_SIZE,HAT_SIZE], center=true);
}

module drawBody()
{
	sphere(RADIUS,$fn=FACETS);

	translate([0,0,RADIUS*1.2])
	sphere(RADIUS*0.8, $fn=FACETS);

	translate([0,0,RADIUS*2.2])
	sphere(RADIUS*0.6,$fn=FACETS);
}

//drawRoundedCylinder(10,5,1,true,true);

drawBody();
drawHat();
