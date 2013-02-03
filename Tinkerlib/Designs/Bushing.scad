
DETAIL=30;
FAST=1;

include <TinkerLib.scad>;

MY_BUSHING_DATA_REEL_SUPPORT=[
	12,							/* BUSHING_LENGTH */
	10/2 + MACHINE_INSET_FUDGE,	/* BUSHING_INNER_RADIUS */
	15.2/2,						/* BUSHING_OUTER_RADIUS */
	20/2,						/* BUSHING_SHOULDER_RADIUS */
	2,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_SOLID,		/* BUSHING_FILL_STYLE */
	0,							/* BUSHING_FILL_ANGLE */
	0,							/* BUSHING_FILL_SIZE */
	0,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST=[
	12,							/* BUSHING_LENGTH */
	10/2 + MACHINE_INSET_FUDGE,	/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	35/2,						/* BUSHING_SHOULDER_RADIUS */
	2,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_ANGLE,		/* BUSHING_FILL_STYLE */
	30,							/* BUSHING_FILL_ANGLE */
	0.5,							/* BUSHING_FILL_SIZE */
	3,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST2=[
	12,							/* BUSHING_LENGTH */
	10/2 + MACHINE_INSET_FUDGE,	/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	35/2,						/* BUSHING_SHOULDER_RADIUS */
	0,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_HOLES,		/* BUSHING_FILL_STYLE */
	45,							/* BUSHING_FILL_ANGLE */
	3.0,							/* BUSHING_FILL_SIZE */
	3,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST3=[
	12,							/* BUSHING_LENGTH */
	20/2 + MACHINE_INSET_FUDGE,	/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	35/2,						/* BUSHING_SHOULDER_RADIUS */
	0,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_SOLID,		/* BUSHING_FILL_STYLE */
	45,							/* BUSHING_FILL_ANGLE */
	3.0,							/* BUSHING_FILL_SIZE */
	3,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST4=[
	12,							/* BUSHING_LENGTH */
	20/2 + MACHINE_INSET_FUDGE,	/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	35/2,						/* BUSHING_SHOULDER_RADIUS */
	3,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_ANGLE,		/* BUSHING_FILL_STYLE */
	45,							/* BUSHING_FILL_ANGLE */
	1.0,							/* BUSHING_FILL_SIZE */
	1,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST5=[
	12,							/* BUSHING_LENGTH */
	20/2 + MACHINE_INSET_FUDGE,	/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	35/2,						/* BUSHING_SHOULDER_RADIUS */
	4,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_HOLES,		/* BUSHING_FILL_STYLE */
	20,							/* BUSHING_FILL_ANGLE */
	1.0,							/* BUSHING_FILL_SIZE */
	1,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST6=[
	12,							/* BUSHING_LENGTH */
	0,							/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	35/2,						/* BUSHING_SHOULDER_RADIUS */
	2,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_HOLES,		/* BUSHING_FILL_STYLE */
	60,							/* BUSHING_FILL_ANGLE */
	3.0,							/* BUSHING_FILL_SIZE */
	1,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	0,							/* BUSHING_SHOULDER_HOLE_COUNT */
	0,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

MY_BUSHING_DATA_TEST7=[
	12,							/* BUSHING_LENGTH */
	0,							/* BUSHING_INNER_RADIUS */
	30.2/2,						/* BUSHING_OUTER_RADIUS */
	42/2,						/* BUSHING_SHOULDER_RADIUS */
	2,							/* BUSHING_SHOULDER_THICKNESS */
	BUSHING_FILL_STYLE_HOLES,		/* BUSHING_FILL_STYLE */
	60,							/* BUSHING_FILL_ANGLE */
	3.0,							/* BUSHING_FILL_SIZE */
	1,							/* BUSHING_FILL_WALL_THICKNESS */
	BUSHING_SHOULDER_STYLE_SOLID,	/* BUSHING_SHOULDER_STYLE */
	3,							/* BUSHING_SHOULDER_HOLE_COUNT */
	1,							/* BUSHING_SHOULDER_HOLE_RADIUS */
];

module drawBushingSampleGallery()
{
	// Row 1

	translate([0,0,0])
	drawBushing( MY_BUSHING_DATA_TEST );
	translate([40,0,0])
	drawBushing( MY_BUSHING_DATA_TEST2 );
	translate([80,0,0])
	drawBushing( MY_BUSHING_DATA_TEST3 );

	// Row 2
	translate([0,40,0])
	drawBushing( MY_BUSHING_DATA_TEST4 );
	translate([40,40,0])
	drawBushing( MY_BUSHING_DATA_TEST5 );
	translate([80,40,0])
	drawBushing( MY_BUSHING_DATA_TEST6 );

	// Row 2
	translate([0,80,0])
	drawBushing( MY_BUSHING_DATA_TEST7 );
}

//drawBushing( MY_BUSHING_DATA_REEL_SUPPORT );
//drawPlateOfBushings( MY_BUSHING_DATA_REEL_SUPPORT, 3, 1 );

//drawBushing( MY_BUSHING_DATA_TEST );

//doubleFlairedCylinder( 100, 15, 10, 10, 20, 20);
//translate([25,0,0])
//cylinder(100, 10, 10,center=true);

drawBushingSampleGallery();