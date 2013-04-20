
/********************************************************************
 * TinkerLib : Trefoil Knot
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <..\TinkerLib\TinkerLib.scad>;

DETAIL=120;

TREFOIL_KNOT_SHAPE=0;
TREFOIL_KNOT_START=1;
TREFOIL_KNOT_END=2;
TREFOIL_KNOT_INDEX=3;

TREFOIL_KNOT_TEST1=[
	0,		/* TREFOIL_KNOT_SHAPE */
	0,		/* TREFOIL_KNOT_START */
	800,	/* TREFOIL_KNOT_END */
	1		/* TREFOIL_KNOT_INDEX */
];

TREFOIL_KNOT_TEST2=[
	4,		/* TREFOIL_KNOT_SHAPE */
	0,		/* TREFOIL_KNOT_START */
	800,	/* TREFOIL_KNOT_END */
	2		/* T4EFOIL_KNOT_INDEX */
];

module drawTrefoilKnotFlat()
{
	for (t = [0 : 800] )
	{
		translate([
			sin(t)+2*sin(2*t),
			cos(t)-2*cos(2*t),
			-1*cos(3*t),
			])
		sphere(.5, $fn=10);
	}
}

module drawShape0(data, iteration)
{
	sphere(.5, $fn=DETAIL);
}

module drawShape1(data, iteration)
{
	sphere(sin(iteration/800)*cos(iteration)*20, $fn=DETAIL);
}

module drawShape2(data, iteration)
{
	scale([iteration/400,1,1])
	sphere(.5, $fn=DETAIL);
}

module drawShape3(data, iteration)
{
	scale([iteration/600,1,1])
	sphere(.5, $fn=DETAIL);
}

module drawShape4(data, iteration)
{
	sphere(.1, $fn=DETAIL);
	translate([1.1,0,0])
	sphere(.1, $fn=DETAIL);
	rotate([0,90,0])
	translate([0.0,0,0])
	cylinder(1, .05, .05, $fn=DETAIL);
}

module drawShape(data, iteration)
{
	if ( data[TREFOIL_KNOT_SHAPE] == 0 )
	{
		drawShape0(data, iteration);
	}
	else if ( data[TREFOIL_KNOT_SHAPE] == 1 )
	{
		drawShape1(data, iteration);
	}
	else if ( data[TREFOIL_KNOT_SHAPE] == 2 )
	{
		drawShape2(data, iteration);
	}
	else if ( data[TREFOIL_KNOT_SHAPE] == 3 )
	{
		drawShape3(data, iteration);
	}
	else if ( data[TREFOIL_KNOT_SHAPE] == 4 )
	{
		drawShape4(data, iteration);
	}
}

module drawTrefoilKnot(data)
{
	for (t = [data[TREFOIL_KNOT_START] : data[TREFOIL_KNOT_INDEX] : data[TREFOIL_KNOT_END]] )
	{
		translate([
			sin(t)+2*sin(2*t),
			cos(t)-2*cos(2*t),
			-1*sin(3*t),
			])
		drawShape(data, t);
	}
}

// Draw the knot
translate([-.5,0,3.15])
rotate([75,53.5,0])
drawTrefoilKnot(TREFOIL_KNOT_TEST2);

// Draw the base
drawCone(.15,4.25,4);

translate([20,0,0])
cross(20)
cylinder(10,.5,.5);