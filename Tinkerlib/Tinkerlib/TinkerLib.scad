
/********************************************************************
 * TinkerLib : A library of helper functions for OpenSCAD
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <MachineInfo.scad>;

// Real world constants
MM_PER_INCH=25.4;

// General global constants
DIFFERENCE_FUDGE=0.001;
ANGLE_FUDGE=.1;

// Bushing shoulder styles
BUSHING_SHOULDER_STYLE_NONE=0;
BUSHING_SHOULDER_STYLE_SOLID=1;

// Bushing fill styles
BUSHING_FILL_STYLE_SOLID=0;
BUSHING_FILL_STYLE_ANGLE=1;
BUSHING_FILL_STYLE_HOLES=2;

// Indexes into bushing data arrays
BUSHING_LENGTH=0;
BUSHING_INNER_RADIUS=1;
BUSHING_OUTER_RADIUS=2;
BUSHING_SHOULDER_RADIUS=3;
BUSHING_SHOULDER_THICKNESS=4;
BUSHING_FILL_STYLE=5;
BUSHING_FILL_ANGLE=6;
BUSHING_FILL_SIZE=7;
BUSHING_FILL_WALL_THICKNESS=8;
BUSHING_SHOULDER_STYLE=9;
BUSHING_SHOULDER_HOLE_COUNT=10;
BUSHING_SHOULDER_HOLE_RADIUS=11;
BUSHING_HOLE_OFFSET=12;

// Bolt and screw head types
BOLT_HEAD_TYPE_CAP=0;
BOLT_HEAD_TYPE_SCREW45=1;
BOLT_HEAD_TYPE_HEX=2;

// Indexes into bolt data arrays
BOLT_RADIUS=0;
CAP_RADIUS=1;
CAP_THICKNESS=2;
NUT_THICKNESS=3;
NUT_WIDTH=4;

// Metric M3 bolt data
M3_BOLT_RADIUS=3/2;
M3_CAP_RADIUS=5.45/2;
M3_CAP_THICKNESS=3;
M3_NUT_THICKNESS=2.5;
M3_NUT_WIDTH=5.5;
M3_BOLT_DATA=[M3_BOLT_RADIUS, M3_CAP_RADIUS, M3_CAP_THICKNESS, M3_NUT_THICKNESS, M3_NUT_WIDTH];

// Metric M4 bolt data
M4_BOLT_RADIUS=4/2;
M4_CAP_RADIUS=6.9/2;
M4_CAP_THICKNESS=3.95;
M4_NUT_THICKNESS=3.1;
M4_NUT_WIDTH=6.9;
M4_BOLT_DATA=[M4_BOLT_RADIUS, M4_CAP_RADIUS, M4_CAP_THICKNESS, M4_NUT_THICKNESS, M4_NUT_WIDTH];

CAPTIVE_NUT_BORDER=0.6;
BOLT_HOLE_BORDER=0.3;
CAP_BORDER=0.5;

/**
 * Adjust an inner diameter measurement based on machine specific differences.
 */
function adjustInnerDiameter(d) = d*MACHINE_INSET_FUDGE_FACTOR+MACHINE_INSET_FUDGE;


/**
 * Draws a "hole" for a captive nut to fit in based on the faster data passed in.
 * @fastenerData See M3_DATA or M4_DATA or pass in your own to match the hardware you will use.
 * @zfactor The vertical size of the hole as a factor of additional nut sizes to scale to.
 *          0 does not enlarge the hole, 1 gives a double size hole, 2 a triple size, etc...
 **/
module drawCaptiveNutHole(fastenerData, zfactor)
{
	translate([-1*CAPTIVE_NUT_BORDER/2,-1*CAPTIVE_NUT_BORDER/2,-1*CAPTIVE_NUT_BORDER/2])
	cube([ fastenerData[NUT_THICKNESS]+CAPTIVE_NUT_BORDER, fastenerData[NUT_WIDTH]+CAPTIVE_NUT_BORDER, fastenerData[NUT_WIDTH]*(1+zfactor) ]);
}

/**
 * Draws a "hole" for a captive nut to fit in based on the faster data passed in.
 * @fastenerData See M3_DATA or M4_DATA or pass in your own to match the hardware you will use.
 **/
module drawCapHole(fastenerData)
{
	cylinder(fastenerData[CAP_THICKNESS]+CAP_BORDER,
		fastenerData[CAP_RADIUS]+CAP_BORDER/2,
		fastenerData[CAP_RADIUS]+CAP_BORDER/2,
		center=false, $fn=DETAIL);
}

/**
 * Draws a recessed space to hold a hex nut.
 * @fastenerData See M3_DATA or M4_DATA or pass in your own to match the hardware you will use.
 */
module drawRecessedHexNutHole(fastenerData)
{
	assign(
		diam=fastenerData[NUT_WIDTH],
		edgeWidth=tan(30)*fastenerData[NUT_WIDTH] )
	{
		cube([diam, edgeWidth, fastenerData[NUT_THICKNESS]], center=true);
		rotate([0,0,60])
		cube([diam, edgeWidth, fastenerData[NUT_THICKNESS]], center=true);
		rotate([0,0,120])
		cube([diam, edgeWidth, fastenerData[NUT_THICKNESS]], center=true);
	}
}

/**
 * Draws a hole for a bolt with a captive nut but without a recessed cap.
 * @length The length of the bolt (minus the cap thickness)
 * @fastenerData See M3_DATA or M4_DATA or pass in your own to match the hardware you will use.
 * @zfactor The vertical size of the hole as a factor of additional nut sizes to scale to.
 *          0 does not enlarge the hole, 1 gives a double size hole, 2 a triple size, etc...
 **/
module drawBoltHole(length, fastenerData, zfactor)
{
	// Draw the hole
	drawCylinder(length+0.01, fastenerData[BOLT_RADIUS]);

	// Draw captive nut hole
	rotate([0,90,90])
	translate([ -1*length+fastenerData[NUT_THICKNESS], -1*fastenerData[NUT_WIDTH]/2, -1*fastenerData[NUT_WIDTH]/2 ])
	drawCaptiveNutHole(fastenerData, zfactor);
}

/**
 * Draws a hole for a bolt with a captive nut but without a recessed cap.
 * @length The length of the bolt (minus the cap thickness)
 * @fastenerData See M3_DATA or M4_DATA or pass in your own to match the hardware you will use.
 * @zfactor The vertical size of the hole as a factor of additional nut sizes to scale to.
 *          0 does not enlarge the hole, 1 gives a double size hole, 2 a triple size, etc...
 **/
module drawRecessedBoltHole(length, fastenerData, zfactor)
{
	// Draw the hole
	translate([0,0,fastenerData[CAP_THICKNESS]-DIFFERENCE_FUDGE])
	drawCylinder(length+0.01,
		fastenerData[BOLT_RADIUS]+BOLT_HOLE_BORDER/2);

	// Draw captive nut hole
	rotate([0,90,90])
	translate([ -1*length-fastenerData[NUT_THICKNESS], -1*fastenerData[NUT_WIDTH]/2, -1*fastenerData[NUT_WIDTH]/2 ])
	drawCaptiveNutHole(fastenerData, zfactor);

	// Draw a hole for the screw cap
	rotate([0,0,90])
	drawCapHole(fastenerData);
}

module drawScrewHole(length, radius, countersink_length, countersink_radius)
{
	// Draw the hole
	drawCylinder(length+0.01, radius);

	// Draw counter sink
	drawCone(countersink_length, countersink_radius, radius);
}

/**
 * Uses minkowski to round over the edges of the ends of the cylinder.
 */
module drawRoundedCylinder(height, radius1, radius2, roundover)
{
	if ( FAST == 1 )
	{
		drawCone(height, radius1, radius2);
	}
	else
	{
		minkowski()
		{
			drawCone(height, radius1, radius2);
			sphere(r=roundover,$fn=DETAIL);
		}
	}
}

/**
 * Draw a cone with spheres at each end.
 */
module drawRoundedRod(length,radius1,radius2)
{
	translate([0,0,radius1])
	cylinder(length-radius1-radius2,radius1,radius2,$fn=DETAIL, center=false);
	
	translate([0,0,radius1])
	drawHalfSphere(radius1);
	
	translate([0,0,length-radius2])
	rotate([180,0,0])
	drawHalfSphere(radius2);
}

/**
 * Draw a cone with the ends rounded over.
 * NOTE: This uses minkowski() when FAST == 0, so
 * it can be very slow.
 */
module drawRoundedCone(height, radius1, radius2, roundover)
{
	if ( FAST == 1 )
	{
		drawCone(height, radius1, radius2);
	}
	else
	{
		minkowski()
		{
			cylinder(height, radius1, radius2, $fn=DETAIL);
			sphere(r=roundover,$fn=DETAIL);
		}
	}
}

/**
 * Draw a cylindrical tube with the specified radii.
 */
module drawTube(height, outer, inner)
{
	difference()
	{
		drawCylinder(height, outer);

		drawCylinder(height, inner);
	}
}

/**
 * Draw a conical tube with the specified radii.
 */
module drawConicalTube(height, outer1, inner1, outer2, inner2)
{
	difference()
	{
		drawCone(height, outer1, outer2);

		drawCone(height, inner1, inner2);
	}
}

/**
 * Draws a tube with the inner hole offset by the specified vector.
 */
module drawTubeWithOffset(height, outer, inner, offset)
{
	difference()
	{
		cylinder(height, outer, outer, $fn=DETAIL);

		translate(offset)
		cylinder(height, adjustInnerDiameter(inner), adjustInnerDiameter(inner), $fn=DETAIL);
	}
}

/**********************************************************
 * Draw an arc of a cylinder with up to 180 degrees.
 *********************************************************/
module drawCylinderArc180(height, radius, angle)
{
	rotate([0,0,-90])
	difference()
	{
		cylinder(height, radius, radius, $fn=DETAIL );

		cube([radius, radius, height+DIFFERENCE_FUDGE]);
		rotate([0, 0, angle])
		translate([-1*radius,-1*radius,0])
		cube([radius, radius*2, height+DIFFERENCE_FUDGE]);

		translate([0, -1*radius, 0])
		cube([radius, radius, height+DIFFERENCE_FUDGE]);
	}
}

module drawCylinderArc(height, radius, angle)
{
	if ( angle > 180 )
	{
		drawCylinderArc180(height, radius, (angle/2)+ANGLE_FUDGE);
		rotate([0,0,angle/2])
		drawCylinderArc180(height, radius, angle/2);
	}
	else
	{
		drawCylinderArc180(height, radius, angle);
	}
}

/**********************************************************
 * Draw an arc of a tube
 *********************************************************/
module drawTubeArc(height, outerRadius, innerRadius, angle)
{
	difference()
	{
		drawCylinderArc(height, outerRadius, angle);

		drawCylinderArc(height+DIFFERENCE_FUDGE, adjustInnerDiameter(innerRadius), angle+ANGLE_FUDGE);
	}
}


module drawRoundedCube2( size, roundover, edges)
{
	width = size[0] - roundover*2;
	depth = size[1] - roundover*2;
	h = size[2];

	translate([roundover, roundover,0])
	linear_extrude(height=h, true)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([width,0,0])
	linear_extrude(height=h, true)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([width,depth,0])
	linear_extrude(height=h)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([0,depth,0])
	linear_extrude(height=h)
	circle(roundover,$fn=DETAIL);

	translate([roundover, roundover,0])
	translate([-1*roundover,0,0])
	cube([width+roundover*2,depth,h]);

	translate([roundover, roundover,0])
	translate([0,-1*roundover,0])
	cube([width,depth+roundover*2,h]);
}

module drawRoundedCube(size, radius)
{
	if ( FAST == 1 )
	{
		cube(size, center=true);
	}
	else
	{
		minkowski()
		{
			cube([size[0]-radius*2, size[1]-radius*2, size[2]-radius*2], center=true);
			sphere(r=radius,$fn=DETAIL);
		}
	}
}

/**
 * Draws a cubes with the specified size with the corners chamfered 
 * by the spacified amount.
 */
module drawChamferedCube(sizes,chamferSize)
{
	difference()
	{
		cube(sizes);
		
		// X/Y plane chamfers
		translate([chamferSize,0,0])
		rotate([0,-45,0])
		translate([-1*sizes[0],0,0])
		cube(sizes);

		translate([sizes[0]-chamferSize,0,0])
		rotate([0,45,0])
		cube(sizes);

		translate([0,sizes[1]-chamferSize,0])
		rotate([-45,0,0])
		cube(sizes);

		translate([0,chamferSize,0])
		rotate([45,0,0])
		translate([0,-1*sizes[1],0])
		cube(sizes);

		// Offset X/Y plane chamfers
		translate([chamferSize,0,sizes[2]])
		rotate([0,-45,0])
		translate([-1*sizes[0],0,0])
		cube(sizes);

		translate([0,sizes[1]-chamferSize,sizes[2]])
		rotate([-45,0,0])
		cube(sizes);

		translate([0,0,sizes[2]-chamferSize])
		rotate([45,0,0])
		cube(sizes);

		translate([sizes[0],0,sizes[2]-chamferSize])
		rotate([0,-45,0])
		cube(sizes);

		// Y/Z Plane Chamfers
		translate([chamferSize,0,0])
		rotate([0,0,-225])
		cube(sizes);

		translate([chamferSize,sizes[1],0])
		rotate([0,0,-225])
		cube(sizes);

		translate([sizes[0]-chamferSize,0,0])
		rotate([0,0,-45])
		cube(sizes);

		translate([sizes[0],sizes[1]-chamferSize,0])
		rotate([0,0,45])
		cube(sizes);
	}	
}

//*********************************************************************
// Replication Routines
//*********************************************************************

/**
 * Draw a transparent view of the build area to check placement
 * of items.
 * Inspired by http://www.thingiverse.com/thing:12831
 **/
module drawBuildArea()
{
	%translate([0,0,MACHINE_SIZE_Z/2])
	cube([MACHINE_SIZE_X,MACHINE_SIZE_Y,MACHINE_SIZE_Z], center = true);
}

/**
 * Draw a transparent view of the build area to check placement
 * of items. 
 * Inspired by http://www.thingiverse.com/thing:12831
 **/
module drawBuildAreaXY()
{
	%translate([MACHINE_SIZE_X/2,MACHINE_SIZE_Y/2,MACHINE_SIZE_Z/2])
	cube([MACHINE_SIZE_X,MACHINE_SIZE_Y,MACHINE_SIZE_Z], center = true);
}

/**
 * Replicate an STL file along the X access with the given spacing
 **/
module replicateOnX( filename, count, spacing )
{
	for ( i = [ 0 : count-1 ] )
	{
		translate( [i * spacing, 0, 0 ] )
		import_stl(filename, convexity = 5, center = true);
	}
}

/**
 * Replicate an STL file in a grid with the given spacing
 **/
module replicateOnGrid( filename, xCount, yCount, xSpacing, ySpacing )
{
	for ( x = [ 0 : xCount-1 ] )
	{
		for ( y= [ 0 : yCount-1 ] )
		{
			translate([x*xSpacing, y*ySpacing, 0])
			import_stl( filename, convexity=5, center=true );
		}
	}
}

//*********************************************************************
// Gridded Shape Group Routines
//*********************************************************************

/**
 * Draw a grid of cylinders at equal spacing.
 **/
module drawGridOfCylinders( height, xCount, yCount, xSpacing, ySpacing, cylinderRadius1, cylinderRadius2 )
{
	for ( x = [ 0 : xCount-1 ] )
	{
		for ( y = [ 0 : yCount-1 ] )
		{
			translate([xSpacing*x, xSpacing*y, height/2])
			cylinder(height, cylinderRadius1, cylinderRadius2, center=true, $fn=DETAIL);
		}
	}
}

//*********************************************************************
// Radial Shape Group Routines
//*********************************************************************

/**
 * Draw a set of radial cylinders at equal angles.
 **/
module drawRadialCylinders( height, radialDistance, cylinderRadius1, cylinderRadius2, angle )
{
	for ( i = [ 0 : (360/angle)-1 ] )
	{
		rotate([0, 0, angle*i])
		translate([radialDistance, 0, height/2])
		cylinder(height, cylinderRadius1, cylinderRadius2, center=true, $fn=DETAIL);
	}
}

/**
 * Draw a set of radial cubes at equal angles.
 **/
module drawRadialCubes( size, radialDistance, angle )
{
	for ( i = [ 0 : (360/angle)-1 ] )
	{
		rotate([0, 0, angle*i])
		translate([radialDistance, 0, size[2]/2])
		cube(size, center=true, $fn=DETAIL);
	}
}


//*********************************************************************
// Bushing Routines
//*********************************************************************

module drawBushing( data )
{
	if ( data[BUSHING_SHOULDER_STYLE] == BUSHING_SHOULDER_STYLE_SOLID )
	{
		difference()
		{
			// Draw the shoulder
			drawTubeWithOffset( data[BUSHING_SHOULDER_THICKNESS], data[BUSHING_SHOULDER_RADIUS], data[BUSHING_INNER_RADIUS], data[BUSHING_HOLE_OFFSET] );

			// Draw the holes
			for ( i = [ 0 : data[BUSHING_SHOULDER_HOLE_COUNT]-1 ] )
			{
				rotate([0,0,i*(360/data[BUSHING_SHOULDER_HOLE_COUNT])])
				translate([(data[BUSHING_SHOULDER_RADIUS]-data[BUSHING_OUTER_RADIUS])/2 + data[BUSHING_OUTER_RADIUS],0,0])
				cylinder(data[BUSHING_SHOULDER_THICKNESS], data[BUSHING_SHOULDER_HOLE_RADIUS], data[BUSHING_SHOULDER_HOLE_RADIUS], $fn=DETAIL );
			}
		}
	}
	
	translate(data[BUSHING_HOLE_OFFSET])
	{
		if ( data[BUSHING_FILL_STYLE] == BUSHING_FILL_STYLE_SOLID )
		{
			translate([0,0,data[BUSHING_SHOULDER_THICKNESS]])
			drawTube( data[BUSHING_LENGTH], data[BUSHING_OUTER_RADIUS], data[BUSHING_INNER_RADIUS] );
		}
		else if ( data[BUSHING_FILL_STYLE] == BUSHING_FILL_STYLE_ANGLE )
		{
			translate([0,0,data[BUSHING_SHOULDER_THICKNESS]])
			drawTube( data[BUSHING_LENGTH], data[BUSHING_OUTER_RADIUS], data[BUSHING_OUTER_RADIUS]-data[BUSHING_FILL_WALL_THICKNESS] );

			translate([0,0,data[BUSHING_SHOULDER_THICKNESS]])
			drawTube( data[BUSHING_LENGTH], data[BUSHING_INNER_RADIUS]+data[BUSHING_FILL_WALL_THICKNESS], data[BUSHING_INNER_RADIUS] );

			translate([0, 0, data[BUSHING_SHOULDER_THICKNESS]])
			drawRadialCubes( [data[BUSHING_OUTER_RADIUS]-adjustInnerDiameter(data[BUSHING_INNER_RADIUS]), data[BUSHING_FILL_SIZE], data[BUSHING_LENGTH]],
				adjustInnerDiameter(data[BUSHING_INNER_RADIUS]) + data[BUSHING_FILL_WALL_THICKNESS] + (data[BUSHING_OUTER_RADIUS]-adjustInnerDiameter(data[BUSHING_INNER_RADIUS])-2*data[BUSHING_FILL_WALL_THICKNESS])/2,
				data[BUSHING_FILL_ANGLE] );
		}
		else if ( data[BUSHING_FILL_STYLE] == BUSHING_FILL_STYLE_HOLES )
		{
			difference()
			{
				translate([0,0,data[BUSHING_SHOULDER_THICKNESS]])
				drawTube( data[BUSHING_LENGTH], data[BUSHING_OUTER_RADIUS], data[BUSHING_INNER_RADIUS] );

				translate([0, 0, data[BUSHING_SHOULDER_THICKNESS]])
				# drawRadialCylinders( data[BUSHING_LENGTH]+DIFFERENCE_FUDGE,
					(data[BUSHING_OUTER_RADIUS]-data[BUSHING_INNER_RADIUS])/2+data[BUSHING_INNER_RADIUS],
					data[BUSHING_FILL_SIZE], data[BUSHING_FILL_SIZE], data[BUSHING_FILL_ANGLE] );
			}
		}
	}
}

module drawPlateOfBushings( data, xCount, yCount )
{
	drawBuildArea();

	xSpacing = data[BUSHING_SHOULDER_RADIUS] * 2.1;
	ySpacing = data[BUSHING_SHOULDER_RADIUS] * 2.1;

	for ( x = [ 0 : xCount-1 ] )
	{
		for ( y= [ 0 : yCount-1 ] )
		{
			translate([x*xSpacing, y*ySpacing, 0])
			drawBushing( data );
		}
	}

}

//*********************************************************************
// Flaired Shape Routines
//*********************************************************************

/**
 * Draws a flaired cylinder using a parabola.
 * ISSUE: Height is slightly off in some cases of MACHINE_LAYERS_PER_MM and different heights
 */
module drawRadiusCylinder(height, radius1, radius2)
{
	for ( z = [ 0 : 1/(height*DETAIL/10) : 1 ] )
	{
		translate([0,0,z*height])
		cylinder(1/MACHINE_LAYERS_PER_MM, radius1+(radius2-radius1)*z*z, radius1+(radius2-radius1)*z*z, center=false, $fn=DETAIL);
	}
}

/**
 * Draws a cylinder with flairs at each end using a parabola.
 * ISSUE: Height is slightly off in some cases of MACHINE_LAYERS_PER_MM and different heights
 */
module drawDoubleFlairedCylinder( height, flairHeight, radius1, radius2, flairRadius1, flairRadius2 )
{
	// Draw the main cylinder
	cylinder(height, radius1, radius2, center=true, $fn=DETAIL);

	// Draw the flair
	translate([0,0,height/2-flairHeight])
	drawRadiusCylinder(flairHeight, radius1, flairRadius1);

	// Draw the other flair
	translate([0,0,-1*height/2+flairHeight])
	rotate([0,180,0])
	drawRadiusCylinder(flairHeight, radius2, flairRadius2);
}

/**
 * Draw a half sphere in the same way sphere(radius) would.
 * The bottom half of the sphere is left after subtracting
 * off the top half.
 */
module drawHalfSphere(radius)
{
	difference()
	{
		sphere(radius,$fn=DETAIL);

		// Subtract off a bigger cube than necessary
		translate([-1.5*radius,-1.5*radius,0])
		cube([radius*3,radius*3,radius]);
	}
}

/**
 * Draw a half sphere shell in the same way sphere(radius) would.
 * The bottom half of the sphere is left after subtracting
 * off the top half. Then, The inner part of the sphere is 
 * hollowed out so that the remaining shell has the specified
 * thickness.
 */
module drawHalfSphereShell(radius,thickness)
{
	difference()
	{
		sphere(radius,$fn=DETAIL);

		// Subtract off a bigger cube than necessary
		translate([-1.5*radius,-1.5*radius,0])
		cube([radius*3,radius*3,radius]);

		sphere(radius-thickness,$fn=DETAIL);
	}
}

module drawEquilateralTriangle(height,side)
{
	difference()
	{
		cube([side,side,height]);

		rotate([0,0,60])
		cube([side*2,side*2,height]);
		translate([side,0,0])
		rotate([0,0,30])
		cube([side*2,side*2,height]);
	}
}


module drawSphereShell(outerRadius, innerRadius)
{
	difference()
	{
		sphere(outerRadius, $fn=DETAIL);

		sphere(innerRadius, $fn=DETAIL);
	}
}

module drawCylinderDifference(height, radius1, radius2, offset)
{
	difference()
	{
		cylinder(height,radius1,radius1,$fn=DETAIL);

		translate(offset)
		cylinder(height,radius2,radius2,$fn=DETAIL);
	}
}

module drawCylinder(height, radius)
{
	cylinder(height,radius,radius,$fn=DETAIL);
}

module drawCone(height, radius1, radius2)
{
	cylinder(height,radius1,radius2,$fn=DETAIL);
}


/**
 * Draw a simple simple ruler with breaks every 25mm along the height
 */
module drawRuler(height, width)
{
	for (i = [0:height/25])
	{
		translate([0,0,25*i])
		cube([width,(width/10),24]);
	}
}


module drawSphere(radius)
{
	sphere(radius, $fn=DETAIL);
}


module drawLinkedCylinders(length1, length2, angle, radius)
{
	drawCylinder(length1, radius);

	translate([0, 0, length1])
	drawSphere(radius);
	translate([0, 0, length1])
	drawSphere(radius);

	translate([0, 0, length1])
	rotate([angle,0,0])
	drawCylinder(length2, radius);
}

module drawLinkedCylinderGroup(length1, lengths, angles, radius)
{
	drawCylinder(length1, radius);

	translate([0, 0, length1])
	drawSphere(radius);

	for ( i = [ 0 : len(lengths) ] )
	{
		translate([0, 0, length1])
		rotate([angles[i],0,0])
		drawCylinder(lengths[i], radius);
	}
}

module drawLinkedRods(length1, length2, angle, radius)
{
	drawRoundedRod(length1, radius, radius);

	translate([0, 0, length1])
	drawSphere(radius);

	translate([0, 0, length1])
	rotate([angle,0,0])
	drawRoundedRod(length2, radius, radius);
}

module drawLinkedTubes(length1, length2, angle, outerRadius, innerRadius)
{
	difference()
	{
		drawLinkedCylinders(length1, length2, angle, outerRadius);

		drawLinkedCylinders(length1, length2, angle, innerRadius);
	}
}


/**
 * Draw a transition from one radius to another with a cylinder at each
 * end and a cone in the middle.
 */
module drawCylinderTransition(length, radius1, radius2, transitionLength)
{
	drawCylinder(transitionLength, radius1);

	translate([0,0,transitionLength])
	drawCone(length-(2*transitionLength), radius1, radius2);

	translate([0,0,length-transitionLength])
	drawCylinder(transitionLength, radius2);
}


/**
 * Draw a transition from one radius to another with a cone at each
 * end and a cylinder in the middle.
 */
module drawConeTransition(length, radius1, radius2, transitionLength)
{
	drawCone(transitionLength,radius1,(radius1+radius2)/2);

	translate([0,0,transitionLength])
	drawCylinder(length-(2*transitionLength),(radius1+radius2)/2);

	translate([0,0,length-transitionLength])
	drawCone(transitionLength,(radius1+radius2)/2, radius2);
}
