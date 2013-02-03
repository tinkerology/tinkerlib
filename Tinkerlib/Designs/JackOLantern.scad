
DETAIL=60;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>

module drawPin(radius,length)
{
	cylinder( 4, 0, radius, $fn=DETAIL );
	translate([0,0,4])
	cylinder( length-4, radius, radius, $fn=DETAIL );
}

module drawEyeOrNose(size)
{
	drawPin(2,14);

	translate([-15,-7,14])
	drawEquilateralTriangle(2,size);
}

module drawScaryEye(size)
{
	drawPin(2,14);

	translate([0,size/1.5,14])
	{
		difference()
		{
			cylinder(2,size,size);

			translate([0,size,0])
			cylinder(2,size*1.5,size*1.5);
			translate([size*2,0,0])
			cylinder(2,size*1.5,size*1.5);
		}
	}
}

module drawRoundNose(size)
{
	drawPin(2,14);

	translate([0,0,14])
	cylinder(2,size,size);
}

module drawMouth(size)
{
	// Draw the smile
	translate([0,-3*size,0])
	difference()
	{
		cylinder(2,size*6,size*6);

		# translate([0,-4*size,0])
		cylinder(2,size*8,size*8);

		// Draw teeth at top
		# translate([size,3.8*size,0])
		rotate([0,0,-10])
		drawTooth(size);

		# translate([size*3,3.3*size,0])
		rotate([0,0,-20])
		drawTooth(size);

		# translate([-1*size,3.8*size,0])
		rotate([0,0,10])
		drawTooth(size);

		# translate([size*-3,3.3*size,0])
		rotate([0,0,20])
		drawTooth(size);

		// Draw teeth at bottom
		# translate([size/2,5.5*size,0])
		rotate([0,0,-10])
		drawTooth(size);

		# translate([size*2.5,4.9*size,0])
		rotate([0,0,-20])
		drawTooth(size);

		# translate([-2*size,5.2*size,0])
		rotate([0,0,10])
		drawTooth(size);

		# translate([size*-4,3.9*size,0])
		rotate([0,0,40])
		drawTooth(size);
	}

	// Draw pins
	translate([0,-3*size,0])
	{
		translate([size*1.5,size*4.7,-14])
		drawPin(2,14);
		translate([size*4,size*3.5,-14])
		drawPin(2,14);
		translate([size*-1.5,size*4.7,-14])
		drawPin(2,14);
		translate([size*-4,size*3.5,-14])
		drawPin(2,14);
	}
}

module drawTooth(size)
{
	cube([size/2,size/2,2]);
}

module drawPrintableMouth1(size)
{
	intersection()
	{
		drawMouth(size);
		
		translate([0,-50*size,-15])
		# cube([size*3,size*100,30]);
	}
}

module drawPrintableMouth2(size)
{
	intersection()
	{
		drawMouth(size);
		
		translate([size*3,-50*size,-15])
		# cube([size*3,size*100,30]);
	}
}

module drawPrintableMouth3(size)
{
	intersection()
	{
		drawMouth(size);
		
		translate([-3*size,-50*size,-15])
		# cube([size*3,size*100,30]);
	}
}

module drawPrintableMouth4(size)
{
	intersection()
	{
		drawMouth(size);
		
		translate([-6*size,-50*size,-15])
		# cube([size*3,size*100,30]);
	}
}


drawScaryEye(30);
//drawRoundNose(30);
//drawEyeOrNose(30);
//drawMouth(30);
//drawPrintableMouth1(30);
//translate([5,0,0])
//drawPrintableMouth2(30);
//translate([-5,0,0])
//drawPrintableMouth3(30);
//translate([-10,0,0])
//drawPrintableMouth4(30);
