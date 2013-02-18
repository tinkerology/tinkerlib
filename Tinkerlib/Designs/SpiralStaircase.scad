
/********************************************************************
 * TinkerLib : Spiral staircase
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

PIN_RADIUS=0;
PIN_INNER_RADIUS=1;
STUD_FUDGE=2;
STUD_LENGTH=3;

STAIRCASE_PIN_DATA=[4, 2.5, 0.1, 3];
TEST_PIN_DATA=[4, 2.5, 0.3, 3];

STAIR_ANGLE=0;
STAIR_RADIUS=1;
STAIR_THICKNESS=2;
STAIR_HEIGHT=3;
SUPPORT_BRACKET_STEP=4;
STAIR_BASE_HEIGHT=5;
STAIR_BASE_WIDTH=6;

STAIR_DATA=[30, 60, 2, 15, 15/50, 4, (60*2*1.1)/1.414];

DETAIL=120;

include <..\Tinkerlib\TinkerLib.scad>;

/**
 * Draw a nesting support pin.
 **/
module drawSupportPin(height, pinData)
{
	// Draw the outer tube
	drawTube( height, pinData[PIN_RADIUS], pinData[PIN_INNER_RADIUS] );
	// Fill in part of the tube for support of the outer pin
	translate([0,0,height-pinData[STUD_LENGTH]])
	cylinder( pinData[STUD_LENGTH], pinData[PIN_INNER_RADIUS], pinData[PIN_INNER_RADIUS], $fn=DETAIL );
	// Draw the mating pin
	translate([0,0,height])
	cylinder( pinData[STUD_LENGTH], pinData[PIN_INNER_RADIUS]-pinData[STUD_FUDGE], pinData[PIN_INNER_RADIUS]-pinData[STUD_FUDGE], $fn=DETAIL );
}

/**
 * Draw a single step consisting of a platform, two support
 * pins and a hole to place the next step's support pin in.
 **/
module drawStep(stairData, pinData)
{
	// Draw the step
	difference()
	{
		drawTubeArc( stairData[STAIR_THICKNESS], stairData[STAIR_RADIUS], pinData[PIN_RADIUS], stairData[STAIR_ANGLE] );

		// Draw the outside support hole
		rotate([0,0, stairData[STAIR_ANGLE]*0.15])
		translate([stairData[STAIR_RADIUS]-pinData[PIN_RADIUS],0,0])
		cylinder( pinData[STUD_LENGTH], pinData[PIN_INNER_RADIUS], pinData[PIN_INNER_RADIUS], $fn=DETAIL);
	}

	// Draw the support for the step to make it attach more securely to the pin
	translate([0,0, stairData[STAIR_THICKNESS]])
	for ( i = [ 0 : 1 : 20 ] )
	{
		translate([0,0,i*stairData[SUPPORT_BRACKET_STEP]])
		drawTubeArc( stairData[SUPPORT_BRACKET_STEP], pinData[PIN_RADIUS]+stairData[STAIR_RADIUS]/(10+i*3), pinData[PIN_RADIUS], stairData[STAIR_ANGLE]+i*5 );
	}

	// Draw the outside support pin
	rotate([0,0, stairData[STAIR_ANGLE]*0.85])
	translate([stairData[STAIR_RADIUS]-pinData[PIN_RADIUS],0,0])
	drawSupportPin(stairData[STAIR_HEIGHT], pinData);

	// Draw the center support pin
	drawSupportPin(stairData[STAIR_HEIGHT], pinData);
}

/**
 * Draw a square base to hold the spiral staircase.
 * It consists of a thin base with two holes to place
 * support pins in.
 **/
module drawBase(stairData, pinData)
{
	drawBuildArea();

	// Center in the build area
	translate( [stairData[STAIR_BASE_WIDTH]/-2,
		stairData[STAIR_BASE_WIDTH]/-2, 0] )
	difference()
	{
		cube([stairData[STAIR_BASE_WIDTH],stairData[STAIR_BASE_WIDTH],stairData[STAIR_BASE_HEIGHT]]);

		translate([stairData[STAIR_BASE_WIDTH]/2,stairData[STAIR_BASE_WIDTH]/2,0])
		cylinder( stairData[STAIR_BASE_HEIGHT]+DIFFERENCE_FUDGE, pinData[PIN_INNER_RADIUS], pinData[PIN_INNER_RADIUS], $fn=DETAIL);

		translate([stairData[STAIR_BASE_WIDTH]/2,stairData[STAIR_BASE_WIDTH]/2,0])
		rotate([0,0,45])
		translate([stairData[STAIR_RADIUS]-pinData[PIN_RADIUS],0,0])
		cylinder( stairData[STAIR_BASE_HEIGHT]+DIFFERENCE_FUDGE, pinData[PIN_INNER_RADIUS], pinData[PIN_INNER_RADIUS], $fn=DETAIL);
	}	
}

module drawTestSupports()
{
	drawSupportPin(STAIR_DATA[STAIR_HEIGHT]/2, TEST_PIN_DATA);

	// Draw the center support
	translate([15,0,0])
	drawSupportPin(STAIR_DATA[STAIR_HEIGHT]/2, TEST_PIN_DATA);
}


module drawPrintablePlate()
{
	drawBuildArea();

	translate([-10,0,0])
	drawStep(STAIR_DATA, STAIRCASE_PIN_DATA);

	translate([20,40,0])
	rotate([0,0,180])
	drawStep(STAIR_DATA, STAIRCASE_PIN_DATA);

	translate([-10,-50,0])
	drawStep(STAIR_DATA, STAIRCASE_PIN_DATA);

	translate([20,-20,0])
	rotate([0,0,180])
	drawStep(STAIR_DATA, STAIRCASE_PIN_DATA);
}

drawStep(STAIR_DATA, STAIRCASE_PIN_DATA);
//drawBase(STAIR_DATA, STAIRCASE_PIN_DATA);
//drawTestSupports();
//drawPrintablePlate();
