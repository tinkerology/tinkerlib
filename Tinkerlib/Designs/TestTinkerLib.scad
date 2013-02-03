
DETAIL=120;
FAST=0;

include <TinkerLib.scad>;

module drawCaptiveNutTest()
{
	difference()
	{
		cube([25,25,5]);

		translate([12,7,5-M3_BOLT_DATA[NUT_THICKNESS]/2+DIFFERENCE_FUDGE])
		rotate([0,0,90])
		# drawRecessedHexNutHole(M3_BOLT_DATA);

		translate([12,17,5-M4_BOLT_DATA[NUT_THICKNESS]/2+DIFFERENCE_FUDGE])
		rotate([0,0,90])
		# drawRecessedHexNutHole(M4_BOLT_DATA);
	}
}

//drawRoundedCube([10,10,1],1);

//drawRoundedCylinder(10, 1);

//drawRoundedCone(10, 5, 2, 1);

//drawCylinderArc(100, 50, 275);

//drawTubeArc(100, 50, 40, 330);

//drawCaptiveNutTest();

//drawTubeWithOffset(10, 100, 50, [20,0,0]);

//drawChamferedCube([10,20,30],1.5);

module drawWineGlass()
{
	translate([0,0,40])
	{
		scale([.5,.5,1])
		drawHalfSphereShell(20,2);

		translate([0,0,-29])
		drawDoubleFlairedCylinder( 20, 5, 1.5, 1.5, 3, 10 );
	}
}

drawWineGlass();
