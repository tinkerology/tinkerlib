

THICKNESS=4.1;
WIDTH=7.5;
ANGLE=45;
CROSSBAR_LENGTH=60;
DOWNBAR_LENGTH=45;
SKID_RADIUS=2.65;
SKID_LENGTH=10;
DETAIL=40;
SKID_HOLDER_THICKNESS=2;

module drawDownBar()
{
	translate([0,0,-1*WIDTH/2])
	cylinder(WIDTH, THICKNESS/2, THICKNESS/2,$fn=DETAIL);

	translate([DOWNBAR_LENGTH/2,0,0])
	cube([DOWNBAR_LENGTH,THICKNESS,WIDTH], center=true);

	translate([DOWNBAR_LENGTH+SKID_RADIUS,0,-1*WIDTH/2])
	difference()
	{
		cylinder(SKID_LENGTH, SKID_RADIUS+SKID_HOLDER_THICKNESS, SKID_RADIUS+SKID_HOLDER_THICKNESS,$fn=DETAIL);

		cylinder(SKID_LENGTH, SKID_RADIUS, SKID_RADIUS,$fn=DETAIL);
	}
}

cube([CROSSBAR_LENGTH,THICKNESS,WIDTH],center=true);

translate([CROSSBAR_LENGTH/2,0,0])
rotate([0,0,ANGLE])
drawDownBar();

translate([-1*CROSSBAR_LENGTH/2,0,0])
rotate([0,0,180-ANGLE])
drawDownBar();

// Draw lower cross bar
//translate([0, DOWNBAR_LENGTH/2,0])
//cube([CROSSBAR_LENGTH*2,THICKNESS/2,WIDTH],center=true);
