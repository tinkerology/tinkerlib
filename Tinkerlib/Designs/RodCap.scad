DETAIL=130;
FAST=1;

include <TinkerLib.scad>;

ROD_INTERNAL_RADIUS=0;
ROD_CAP_RADIUS=1;


CURTAIN_ROD_CAP=[
	12,					/* ROD_INTERNAL_RADIUS */
	40					/* ROD_CAP_RADIUS */
];


module drawRodCap(data)
{
	difference()
	{
		scale([.3,1,1])
		sphere(r=data[ROD_CAP_RADIUS], $fn=DETAIL);

		translate([5,-50,-50])
		cube([100,100,100]);

		translate([-105,-50,-50])
		cube([100,100,100]);

		
		translate([60,50,0])
		rotate([0,90,0])
		translate([0,-50,-50])
		rotate_extrude(convexity = 10)
		translate([data[ROD_CAP_RADIUS]/2, 0, 0])
		circle(r=data[ROD_CAP_RADIUS]/4, $fn=DETAIL);
	}

	translate([data[ROD_CAP_RADIUS]/1.4,0,0])
	sphere(r=data[ROD_CAP_RADIUS]/1.4, $fn=DETAIL);
}

drawRodCap(CURTAIN_ROD_CAP);