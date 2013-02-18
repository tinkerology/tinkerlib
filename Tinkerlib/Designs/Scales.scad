
/********************************************************************
 * TinkerLib : Scales (incomplete)
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

PIVOT_HEIGHT=10;
PIVOT_BASE=20;
ARM_LENGTH=50;
ARM_WIDTH=10;
ARM_THICKNESS=4;
CUP_RADIUS=10;
CUP_HEIGHT=4;
CUP_BASE=1;
CUP_INNER_RADIUS=9;

DETAIL=20;

module drawPivot()
{
	translate([-1 * PIVOT_BASE/2,ARM_WIDTH/2,0])
	rotate([90,0,0])
	linear_extrude( height=ARM_WIDTH )
	polygon(points=[[0,0],[PIVOT_BASE,0],[PIVOT_BASE/2,PIVOT_HEIGHT]], paths=[[0,1,2]]);
}

module drawArm()
{
	cube([ARM_LENGTH,ARM_WIDTH,ARM_THICKNESS], center=true);

	// cut out the pivot points
}

module drawCup()
{
	difference()
	{
		cylinder( CUP_HEIGHT, CUP_RADIUS, CUP_RADIUS, center=true, $fn=DETAIL );

		translate([0,0,CUP_BASE])
		cylinder( CUP_HEIGHT-CUP_BASE+0.01, CUP_INNER_RADIUS, CUP_INNER_RADIUS, center=true, $fn=DETAIL );
	}
}

module drawScales()
{
	drawPivot();

	translate([0,0,PIVOT_HEIGHT+ARM_THICKNESS/2])
	drawArm();

	translate([ARM_LENGTH/2,0,PIVOT_HEIGHT+ARM_THICKNESS+CUP_HEIGHT/2])
	drawCup();
	translate([-1*ARM_LENGTH/2,0,PIVOT_HEIGHT+ARM_THICKNESS+CUP_HEIGHT/2])
	drawCup();
}

drawScales();