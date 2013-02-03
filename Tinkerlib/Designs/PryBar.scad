DETAIL=120;

include <TinkerLib.scad>;

PRY_BAR_LENGTH=0;
PRY_BAR_WIDTH=1;
PRY_BAR_THICKNESS=2;
PRY_BAR_ANGLE=3;
PRY_BAR_TIP_THICKNESS=4;
PRY_BAR_TIP_LENGTH=5;

TILE_PRY_BAR=
[
	70,		// PRY_BAR_LENGTH
	15,		// PRY_BAR_WIDTH
	8,		// PRY_BAR_THICKNESS
	10,		// PRY_BAR_ANGLE
	0.4,	// PRY_BAR_TIP_THICKNESS
	30		// PRY_BAR_TIP_LENGTH
];

module drawPryBar(data)
{
	difference()
	{
		cube([data[PRY_BAR_LENGTH],
			  data[PRY_BAR_WIDTH],
			  data[PRY_BAR_THICKNESS]], center=false);

		translate([0,0,
			data[PRY_BAR_TIP_THICKNESS]])
		rotate([0,-1*data[PRY_BAR_ANGLE],0])
		cube([data[PRY_BAR_TIP_LENGTH],100,100], center=false);
	}
}

module drawRoundedPryBar(data)
{
		minkowski()
		{
			drawPryBar(data);
			sphere(r=data[PRY_BAR_WIDTH]/8,
				$fn=20);
		}
}

//drawBuildAreaXY();
//drawPryBar(TILE_PRY_BAR);
drawRoundedPryBar(TILE_PRY_BAR);
