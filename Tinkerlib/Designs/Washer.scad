
/*
 * Calibration test for inner and outer circles
 */

OUTER_RADIUS=20;
INNER_RADIUS=10;
THICKNESS=5;
DETAIL=60;

module drawLockWasher( outerRadius, innerRadius, thickness )
{
	difference()
	{
		drawWasher( outerRadius, innerRadius, thickness );

		cube([outerRadius,0.25, thickness*3]);
	}
}


module drawWasher( outerRadius, innerRadius, thickness )
{
	difference()
	{
		cylinder( thickness, outerRadius, outerRadius, $fn=DETAIL );

		cylinder( thickness, innerRadius, innerRadius, $fn=DETAIL );
	}
}

module calibrationTest()
{
	drawWasher( 10, 5, 1 );

	translate( [ 45, 0, 0 ] )
	drawWasher( 30, 15, 1 );

	translate( [ 50, -50, 0 ] )
	drawWasher( 15, 10, 1 );

	translate( [ 10, -40, 0 ] )
	drawWasher( 20, 10, 1 );
}

module towerOfBabelGame()
{
	// Draw base
	cube( [120, 55, 5 ] );

	// Draw pillars
	translate([20,28,0])
	cylinder( 50, 2, 2, $fn=DETAIL );
	translate([60,28,0])
	cylinder( 50, 2, 2, $fn=DETAIL );
	translate([100,28,0])
	cylinder( 50, 2, 2, $fn=DETAIL );

	// Draw pieces
	// Row 1
	translate( [ 10, -15, 0 ] )
	drawWasher( 10, 5, 7 );

	translate( [ 40, -20, 0 ] )
	drawWasher( 15, 5, 7 );

	translate( [ 80, -25, 0 ] )
	drawWasher( 20, 5, 7 );

	// Row 2
	translate( [ 30, -65, 0 ] )
	drawWasher( 30, 5, 7 );

	translate( [ 90, -70, 0 ] )
	drawWasher( 25, 5, 7 );


	//translate( [ 100, -100, 0 ] )
	//drawWasher( 35, 5, 7 );

	//translate( [ 100, -100, 0 ] )
	//drawWasher( 40, 5, 7 );
}

calibrationTest();
//towerOfBabelGame();
