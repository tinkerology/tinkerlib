
/********************************************************************
 * TinkerLib : Geneva drive 
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=60;

// Distance between wheels
WHEEL_VERTICAL_OFFSET=0.1;

DRIVE_WHEEL_RADIUS=30;
DRIVE_WHEEL_PIN_LENGTH=10;
DRIVE_WHEEL_PIN_RADIUS=2;
DRIVE_WHEEL_PIN_OFFSET=22;
DRIVE_WHEEL_THICKNESS=5;
DRIVE_WHEEL_AXLE_LENGTH=10;
DRIVE_WHEEL_AXLE_RADIUS=5;
DRIVE_WHEEL_AXLE_HOLE_RADIUS=1;

DRIVEN_WHEEL_RADIUS=25;
DRIVEN_WHEEL_THICKNESS=5;
DRIVEN_WHEEL_AXLE_LENGTH=DRIVE_WHEEL_THICKNESS;
DRIVEN_WHEEL_AXLE_RADIUS=5;
DRIVEN_WHEEL_AXLE_HOLE_RADIUS=1;
DRIVEN_WHEEL_NOTCH_OFFSET=7;
DRIVEN_WHEEL_CROSS_RADIUS=20;
DRIVEN_WHEEL_CROSS_OFFSET=20 + DRIVEN_WHEEL_RADIUS - 5;

NOTCHES=5;



module drawDriveWheel()
{
	cylinder( DRIVE_WHEEL_THICKNESS, DRIVE_WHEEL_RADIUS, DRIVE_WHEEL_RADIUS, $fn=DETAIL );

	// Draw pin
	translate( [DRIVE_WHEEL_PIN_OFFSET, 0, 0] )
	cylinder( DRIVE_WHEEL_PIN_LENGTH,  DRIVE_WHEEL_PIN_RADIUS, DRIVE_WHEEL_PIN_RADIUS, $fn=DETAIL );

	// Draw center axle
	difference()
	{
		cylinder( DRIVE_WHEEL_AXLE_LENGTH, DRIVE_WHEEL_AXLE_RADIUS, DRIVE_WHEEL_AXLE_RADIUS, $fn=DETAIL );

		cylinder( DRIVE_WHEEL_AXLE_LENGTH, DRIVE_WHEEL_AXLE_HOLE_RADIUS, DRIVE_WHEEL_AXLE_HOLE_RADIUS, $fn=DETAIL );
	}
}

module drawDrivenWheel()
{
	difference()
	{
		cylinder( DRIVEN_WHEEL_THICKNESS, DRIVEN_WHEEL_RADIUS, DRIVEN_WHEEL_RADIUS, $fn=DETAIL );

		for ( i  = [ 0 : NOTCHES ] )
		{
			drawDrivenWheelNotch(360/NOTCHES,i);
		}
	}

	// Draw center axle
	translate([0,0,-1 * DRIVEN_WHEEL_AXLE_LENGTH])
	difference()
	{
		cylinder( DRIVEN_WHEEL_AXLE_LENGTH, DRIVEN_WHEEL_AXLE_RADIUS, DRIVEN_WHEEL_AXLE_RADIUS, $fn=DETAIL );

		cylinder( DRIVEN_WHEEL_AXLE_LENGTH, DRIVEN_WHEEL_AXLE_HOLE_RADIUS, DRIVEN_WHEEL_AXLE_HOLE_RADIUS, $fn=DETAIL );
	}
}

module drawDrivenWheelNotch(rotation, index)
{
	rotate([0,0,rotation*index])
	translate([DRIVEN_WHEEL_NOTCH_OFFSET,-1 * DRIVE_WHEEL_PIN_RADIUS,0])
	cube([DRIVEN_WHEEL_RADIUS-DRIVEN_WHEEL_NOTCH_OFFSET, DRIVE_WHEEL_PIN_RADIUS*2, DRIVEN_WHEEL_THICKNESS]);
	rotate([0,0,rotation/2+rotation*index])
	translate([DRIVEN_WHEEL_CROSS_OFFSET,0,0])
	cylinder( DRIVEN_WHEEL_THICKNESS, DRIVEN_WHEEL_CROSS_RADIUS, DRIVEN_WHEEL_CROSS_RADIUS, $fn=DETAIL );
}

drawDriveWheel();
translate( [ DRIVEN_WHEEL_RADIUS+DRIVE_WHEEL_PIN_OFFSET, 0, DRIVE_WHEEL_THICKNESS] )
drawDrivenWheel();
