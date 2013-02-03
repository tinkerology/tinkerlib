
UPPER_MOLDING_RADIUS=40;
LOWER_MOLDING_RADIUS=20;
WIDTH=6;
THICKNESS=3;
ROUNDOVER=0.5;
LOWER_XOFFSET=UPPER_MOLDING_RADIUS*2+THICKNESS;
LOWER_YOFFSET=THICKNESS*2;

DETAIL=40;

include <..\Tinkerlib\TinkerLib.scad>;


module drawHook()
{
	rotate([0,0,45])
	drawTubeArc( WIDTH, UPPER_MOLDING_RADIUS+THICKNESS, UPPER_MOLDING_RADIUS, 225 );

	translate([UPPER_MOLDING_RADIUS*cos(45),(LOWER_MOLDING_RADIUS)*cos(45)*2,0])
	rotate([0,0,-45])
	cube([LOWER_MOLDING_RADIUS+UPPER_MOLDING_RADIUS-1*THICKNESS, THICKNESS, WIDTH], center=false);

	translate( [UPPER_MOLDING_RADIUS*2+THICKNESS, THICKNESS*2, 0] )
	rotate([0,0,225])
	drawTubeArc( WIDTH, LOWER_MOLDING_RADIUS+THICKNESS, LOWER_MOLDING_RADIUS, 225 );
}

module drawSmoothHook()
{
	minkowski()
	{
		drawHook();
		sphere(r=ROUNDOVER,$fn=DETAIL);
	}

}

//drawSmoothHook();

drawHook();
