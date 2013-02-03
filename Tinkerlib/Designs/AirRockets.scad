DETAIL=120;
FAST=1;

include <TinkerLib.scad>;
include <RocketFins.scad>;

AIR_ROCKET_FINS_1=[
	1.125*MM_PER_INCH/2+.5,	/* FIN_TUBE_INNER_RADIUS */
	2,							/* FIN_TUBE_THICKNESS */
	1.125*MM_PER_INCH/2+18,	/* FIN_BOTTOM_RADIUS */
	1.125*MM_PER_INCH/2+2,		/* FIN_TOP_RADIUS */
	60,							/* FIN_LENGTH */
	3,							/* FIN_THICKNESS */
	60,							/* FIN_TWIST */
	4,							/* FIN_COUNT */
	80,							/* FIN_TUBE_LENGTH */
];




module drawRocketSegment(data)
{
	drawTube(data[FIN_TUBE_LENGTH],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]);

	translate([0,0,data[FIN_TUBE_LENGTH]*.95])
	drawTube(data[FIN_TUBE_LENGTH]/10,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]*2,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]);

	translate([0,0,data[FIN_TUBE_LENGTH]*.85])
	drawConicalTube(data[FIN_TUBE_LENGTH]/10,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]*2,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]);
	
}

module drawPressurePlate(data)
{
	drawTube(data[FIN_TUBE_LENGTH]/5,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]);

	translate([0,0,data[FIN_TUBE_LENGTH]/5])
	drawTube(data[FIN_TUBE_LENGTH]/5,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]*2,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]);

	translate([0,0,data[FIN_TUBE_LENGTH]/10])
	drawConicalTube(data[FIN_TUBE_LENGTH]/10,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]*2,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]);
	
	cylinder(data[FIN_TUBE_LENGTH]/10,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		$fn=DETAIL);
}


module drawNoseCone(data)
{
	translate([0,0,data[FIN_TUBE_LENGTH]/1.5])
	rotate([180,0,0])
//	translate([0,0,data[FIN_TUBE_LENGTH]/10])
	{
	drawConicalTube(data[FIN_TUBE_LENGTH]/1.5,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]*2,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS],
		2.5+data[FIN_TUBE_THICKNESS],
		2.5);

	translate([0,0,data[FIN_TUBE_LENGTH]/-10])
	drawTube(data[FIN_TUBE_LENGTH]/5,
		data[FIN_TUBE_INNER_RADIUS]+DIFFERENCE_FUDGE,
		data[FIN_TUBE_INNER_RADIUS]-data[FIN_TUBE_THICKNESS]);

	color("red")
	drawConicalTube(data[FIN_TUBE_LENGTH]/6,
		data[FIN_TUBE_INNER_RADIUS]+data[FIN_TUBE_THICKNESS]
			+DIFFERENCE_FUDGE,
		data[FIN_TUBE_INNER_RADIUS]-DIFFERENCE_FUDGE,
		data[FIN_TUBE_INNER_RADIUS]+DIFFERENCE_FUDGE,
		data[FIN_TUBE_INNER_RADIUS]-data[FIN_TUBE_THICKNESS]-DIFFERENCE_FUDGE);

	}
}

module drawRocketPlate(data)
{
	drawBuildArea();

	translate([32,32,0])
	drawNoseCone(data);

//	translate([-23,23,0])
	rotate([0,0,15])
	drawFins(data);

	translate([30,-30,0])
	drawRocketSegment(data);
	translate([-30,-30,0])
	drawRocketSegment(data);

	translate([-30,30,0])
	drawPressurePlate(data);
}

module drawPrintableArch(radius)
{
	intersection()
	{
		translate([radius/-3,0,0])
		sphere(radius);
		translate([radius/3,0,0])
		sphere(radius);

		translate([0,radius/3,0])
		sphere(radius);
		translate([0,radius/-3,0])
		sphere(radius);
	}
}

module drawArchTopTube(height,height2,inner,outer)
{
	difference()
	{
		cylinder(height, outer, outer, $fn=DETAIL);

		union()
		{
			drawPrintableArch(inner);
			cylinder(height2, inner, inner, $fn=DETAIL);
		}
	}
}

//drawRocketPlate(AIR_ROCKET_FINS_1);

//drawPrintableArch(30);

//drawArchTopTube(40,10,40,35);

//drawNoseCone(AIR_ROCKET_FINS_1);


/*
difference()
{
	drawNoseCone(AIR_ROCKET_FINS_1);

	cube([100,100,100]);
}
*/
drawPressurePlate(AIR_ROCKET_FINS_1);
