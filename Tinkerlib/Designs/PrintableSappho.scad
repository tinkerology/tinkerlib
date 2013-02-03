
//include <TinkerLib.scad>;

FILENAME="ThingiverseModels/Sapphos_Head_14565.stl";
SCALE=1.25;

module drawPrintableBase()
{
	// Save only the base
	translate([0,20,0])
	intersection()
	{
		import_stl(FILENAME, convexity = 5, center = true);

		translate([0,-50,0])
		cube([50,50,29]);
	}
}

module drawPrintablePart1()
{
	translate([0,65,30])
	rotate([90,0,0])
	intersection()
	{
		// Cut off the base
		difference()
		{
			import_stl(FILENAME, convexity = 5, center = true);

			translate([0,-50,0])
			cube([50,50,29]);
		}

		translate([0,-30,0])
		cube([50,30,120]);
	}
}

module drawPrintablePart2()
{
	translate([-20,-65, -29])
	rotate([-90,0,0])
	intersection()
	{
		// Cut off the base
		difference()
		{
			import_stl(FILENAME, convexity = 5, center = true);

			translate([0,-50,0])
			cube([50,50,29]);
		}

		translate([0,-60,0])
		cube([50,30,120]);
	}
}

//drawBuildArea();

//scale([SCALE,SCALE,SCALE])
drawPrintableBase();
//drawPrintablePart1();
//drawPrintablePart2();
