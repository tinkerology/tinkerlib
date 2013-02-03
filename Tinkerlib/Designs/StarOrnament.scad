
FRAGMENTS=40;

module drawStar(points, length, width, height)
{
	linear_extrude(height=height, center = true, convexity = 10, twist = 0)
	for ( i = [0 : points] )
	{
		rotate( [0,0,i*(360/points)])
		polygon(points=[[-1*width/2,0],[0,length],[width/2,0]], paths=[[0,1,2,0]]);
	}
}

module drawStarWithTwoRayLengths(points, length1, length2, width, height)
{
	drawStar(points, length1, width, height );
	rotate([0,0,180/points])
	drawStar(points, length2, width, height );
}

module drawCylinder(depth, radius)
{
//	cylinder(depth, radius, radius, $fn=FRAGMENTS);
	linear_extrude(height = depth, center = true, convexity = 10, twist = 0)
	circle(radius, $fn=FRAGMENTS);
}

module drawRing(radius, inner, thickness)
{
	difference()
	{
		drawCylinder( thickness, radius );

		drawCylinder( thickness, inner );
	}
}

module drawStarTreeTopper()
{
	drawStarWithTwoRayLengths(10, 10, 15, 3, 1 );

	translate([0,0,5])
	rotate([0,90,0])
	drawRing(5,4,1);

	translate([4,0,4])
	rotate([0,90,0])
	drawRing(4,3,1);
}

module drawStarOrnament()
{
	difference()
	{
		drawStarWithTwoRayLengths(10, 10, 15, 3, 1 );

		translate([10,0,0])
		drawCylinder( 1, .20 );
	}
}

drawStarOrnament();

//translate([35,0,0])
//drawStarTreeTopper();
