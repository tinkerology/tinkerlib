
/********************************************************************
 * TinkerLib : Tongs
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <..\Tinkerlib\TinkerLib.scad>;


WIDTH=10;
LENGTH=100;
THICKNESS=2;
ANGLE=3;
HUB_SEPARATION=7;
TOOTH_RADIUS=0.75;
TOOTH_COUNT=7;
TOOTH_SPACING=3;
TOOTH_OFFSET_FROM_END=0.5;
TOOTH_STYLE=1; // 0=rounded, 1=triangle

MINI_CLIP_HUB=6;
MINI_CLIP_LENGTH=30;
MINI_CLIP_ANGLE=0;
MINI_CLIP_HUB_SEPARATION=6;

DETAIL=60;


module drawHanger()
{
	rotate([90,0,0])
	translate([-1*HUB_SEPARATION+2,0,0])
	difference()
	{
		cylinder(2, 4, 4, center=true, $fn=DETAIL );
		cylinder(2, 2, 2, center=true, $fn=DETAIL );
	}
}

module drawRoundTooth()
{
	cylinder(WIDTH,TOOTH_RADIUS,TOOTH_RADIUS, $fn=DETAIL);
}

module drawTriangleTooth()
{
	translate([0,-1 * (TOOTH_RADIUS*2)/1.21, 0])
	rotate([0,0,45])
	cube([TOOTH_RADIUS*2,TOOTH_RADIUS*2,WIDTH]);
}

module drawTong(length)
{
	// Draw the tong arm
	translate([length/2,0,0])
	cube([length,THICKNESS,WIDTH], center=true);

	// Draw the tong tip
	translate([length,0,0])
	cylinder(WIDTH, THICKNESS/2, THICKNESS/2, center=true, $fn=DETAIL);

	// Draw teeth on the tong
	for ( i = [ 0 : TOOTH_COUNT-1 ] )
	{
		translate([length-TOOTH_OFFSET_FROM_END - (i*TOOTH_SPACING),TOOTH_RADIUS*1.25,-1*WIDTH/2])
		if ( TOOTH_STYLE == 1 )
		{
			drawTriangleTooth();
		}
		else
		{
			drawRoundTooth();
		}
	}
}

module drawHub(radius)
{
	cylinder(WIDTH, radius, radius, center=true, $fn=DETAIL);
}

module drawTongs()
{
	drawHub(HUB_SEPARATION/2+THICKNESS);

	translate([0,HUB_SEPARATION/2,0])
	rotate([180,0,ANGLE])
	drawTong(LENGTH);

	translate([0,-1 * HUB_SEPARATION/2,0])
	rotate([0,0,-1 * ANGLE])
	drawTong(LENGTH);

	drawHanger();
}

module drawMiniClip()
{
	drawHub(MINI_CLIP_HUB);

	translate([0,MINI_CLIP_HUB_SEPARATION/2,0])
	rotate([180,0,MINI_CLIP_ANGLE])
	drawTong(MINI_CLIP_LENGTH);

	translate([0,-1 * MINI_CLIP_HUB_SEPARATION/2,0])
	rotate([0,0,-1 * MINI_CLIP_ANGLE])
	drawTong(MINI_CLIP_LENGTH);
}

module drawMiniClipPlate()
{
	drawBuildArea();

	xCount=2;
	yCount=5;
	xSpacing=50;
	ySpacing=20;

	scale([0.9,0.9,0.9])
	{
	translate([-50,-50,0])
	for ( x = [ 0 : xCount-1 ] )
	{
		for ( y= [ 0 : yCount-1 ] )
		{
			translate([x*xSpacing, y*ySpacing, 0])
			{
				drawMiniClip();
				translate([35,10])
				rotate([0,0,180])
				drawMiniClip();
			}
		}
	}
	}
}

//drawMiniClipPlate();
drawTongs();

