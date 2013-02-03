
DETAIL=120;
FAST=0;

include <TinkerLib.scad>;

WINE_GLASS_HEIGHT=0;
WINE_GLASS_BOWL_RADIUS=1;
WINE_GLASS_BASE_RADIUS=2;
WINE_GLASS_BOWL_DEPTH=3;
WINE_GLASS_THICKNESS=4;
WINE_GLASS_STEM_RADIUS=5;

TEST_WINE_GLASS=[
	40,		/* WINE_GLASS_HEIGHT */
	20,		/* WINE_GLASS_BOWL_RADIUS */
	10,		/* WINE_GLASS_BASE_RADIUS */
	20,		/* WINE_GLASS_BOWL_DEPTH */
	2,		/* WINE_GLASS_THICKNESS */
	1.5,	/* WINE_GLASS_STEM_RADIUS */
];

module drawWineGlass(data)
{
	translate([0,0,data[WINE_GLASS_HEIGHT]])
	{
		scale([.5,.5,1])
		drawHalfSphereShell(data[WINE_GLASS_BOWL_RADIUS],
			data[WINE_GLASS_THICKNESS]);

		translate([0,0,-1*(data[WINE_GLASS_HEIGHT]-data[WINE_GLASS_BOWL_DEPTH]/2)+1])
		drawDoubleFlairedCylinder(
			data[WINE_GLASS_HEIGHT]-
				data[WINE_GLASS_BOWL_DEPTH],
			data[WINE_GLASS_HEIGHT]/8,
			data[WINE_GLASS_STEM_RADIUS],
			data[WINE_GLASS_STEM_RADIUS],
			data[WINE_GLASS_STEM_RADIUS]*2,
			data[WINE_GLASS_BASE_RADIUS] );
	}
}

module drawWineGlassOrig()
{
	translate([0,0,40])
	{
		scale([.5,.5,1])
		drawHalfSphereShell(20,2);

		translate([0,0,-29])
		drawDoubleFlairedCylinder( 20, 5, 1.5, 1.5, 3, 10 );
	}
}

drawWineGlass(TEST_WINE_GLASS);
