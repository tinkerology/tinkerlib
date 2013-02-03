
FILENAME="ThingiverseModels/Sapphos_Head_14565.stl";

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

module justImport()
{
	import_stl(FILENAME, convexity = 5, center = true);
}

justImport();
//drawPrintableBase();
