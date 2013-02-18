
/********************************************************************
 * TinkerLib : Tablet stand
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=120;

include <..\Tinkerlib\TinkerLib.scad>;

TABLET_STAND_SPACING=0;
TABLET_STAND_THICKNESS=1;
TABLET_STAND_HEIGHT=2;
TABLET_STAND_FRONT_DEPTH=3;
TABLET_STAND_BACK_DEPTH=4;
TABLET_STAND_FRONT_HEIGHT=5;
TABLET_STAND_BACK_HEIGHT=6;
TABLET_STAND_BACK_NUB_HEIGHT=7;
TABLET_STAND_BACK_T_WIDTH=8;

GALAXY_TAB_TABLET_STAND=
[
	90,		// TABLET_STAND_SPACING
	8,		// TABLET_STAND_THICKNESS
	35,		// TABLET_STAND_HEIGHT
	30,		// TABLET_STAND_FRONT_DEPTH
	50,		// TABLET_STAND_BACK_DEPTH
	45,		// TABLET_STAND_FRONT_HEIGHT
	80,		// TABLET_STAND_BACK_HEIGHT
	10,		// TABLET_STAND_BACK_NUB_HEIGHT
	50		// TABLET_STAND_BACK_T_WIDTH
];

GALAXY_TAB_TABLET_STAND=
[
	90,		// TABLET_STAND_SPACING
	6,		// TABLET_STAND_THICKNESS
	35,		// TABLET_STAND_HEIGHT
	30,		// TABLET_STAND_FRONT_DEPTH
	50,		// TABLET_STAND_BACK_DEPTH
	40,		// TABLET_STAND_FRONT_HEIGHT
	80,		// TABLET_STAND_BACK_HEIGHT
	6,		// TABLET_STAND_BACK_NUB_HEIGHT
	50		// TABLET_STAND_BACK_T_WIDTH
];

module drawFrontToBackSupport(data)
{
	// Keep the tablet up off the table some
	difference()
	{
		cube([data[TABLET_STAND_FRONT_DEPTH]+
				2*data[TABLET_STAND_THICKNESS],
			data[TABLET_STAND_THICKNESS],
			data[TABLET_STAND_HEIGHT]]);

		union()
		{
		// Draw a cutout to save on plastic
		translate([data[TABLET_STAND_THICKNESS]*-1+
				data[TABLET_STAND_FRONT_DEPTH],
			data[TABLET_STAND_SPACING]/2,
			data[TABLET_STAND_HEIGHT]/2])
		rotate([90,0,0])
		cylinder(data[TABLET_STAND_THICKNESS]*2+
			data[TABLET_STAND_SPACING],
			data[TABLET_STAND_FRONT_DEPTH]*.3,
			data[TABLET_STAND_FRONT_DEPTH]*.3,
			$fn=DETAIL
			);

		translate([data[TABLET_STAND_THICKNESS]*-1+
				data[TABLET_STAND_FRONT_DEPTH],
			data[TABLET_STAND_SPACING]/4,
			data[TABLET_STAND_HEIGHT]/2.3+
			data[TABLET_STAND_FRONT_DEPTH]*.3])
		rotate([0,45,0])
		cube([data[TABLET_STAND_FRONT_DEPTH]*.33,
			  200,
			  data[TABLET_STAND_FRONT_DEPTH]*.33],
			  center=true);		
		}
	}

	// Draw the support that hold the bottom of the tablet
	color("red")
	cube([data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_FRONT_HEIGHT]]);

	// Draw the support that it lays back against
	translate([data[TABLET_STAND_FRONT_DEPTH]+
		data[TABLET_STAND_THICKNESS],0,0])
	cube([data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_BACK_HEIGHT]]);
}

module drawTabletStand(data)
{
	// Draw the supports for the tablet
	drawFrontToBackSupport(data);
	translate([0,data[TABLET_STAND_SPACING],0])
	drawFrontToBackSupport(data);

	// Connect the supports together
	color("blue")
	translate([data[TABLET_STAND_FRONT_DEPTH]+
		data[TABLET_STAND_THICKNESS],0,0])
	cube([data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_SPACING],
		data[TABLET_STAND_THICKNESS]]);

	// Draw the back support to prevent tipping
	color("blue")
	translate([data[TABLET_STAND_FRONT_DEPTH]+
		data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_SPACING]/2,0])
	cube([data[TABLET_STAND_BACK_DEPTH],
		data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_THICKNESS]]);

	// Draw the alternate nub support on back
	color("green")
	translate([data[TABLET_STAND_FRONT_DEPTH]+
		data[TABLET_STAND_BACK_DEPTH]+
		data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_SPACING]/2,0])
	cube([data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_THICKNESS]+
		data[TABLET_STAND_BACK_NUB_HEIGHT] ]);

	// Draw the alternate T support on back
	color("green")
	translate([data[TABLET_STAND_FRONT_DEPTH]+
		data[TABLET_STAND_BACK_DEPTH],
		data[TABLET_STAND_SPACING]/2-
		data[TABLET_STAND_BACK_T_WIDTH]/2+
		data[TABLET_STAND_THICKNESS]/2,
		0])
	cube([data[TABLET_STAND_THICKNESS],
		data[TABLET_STAND_BACK_T_WIDTH],
		data[TABLET_STAND_THICKNESS]]);

}

module drawRoundedTabletStand(data)
{
		minkowski()
		{
			drawTabletStand(data);
			sphere(r=data[TABLET_STAND_THICKNESS]/6,
				$fn=20);
		}
}

//drawBuildAreaXY();
drawTabletStand(GALAXY_TAB_TABLET_STAND);
//drawRoundedTabletStand(GALAXY_TAB_TABLET_STAND);
