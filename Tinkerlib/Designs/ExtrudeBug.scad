
FRAGMENTS=40;

module drawCylinder(depth, radius)
{
//	translate([-1*depth,-1*depth,-1*depth])
	% cylinder(depth, radius, radius/2, $fn=FRAGMENTS);
//	linear_extrude(height = depth, center = true, convexity = 10, twist = 0)
//	circle(radius, $fn=FRAGMENTS);
}


module cubeWithHoles(x,y,z)
{
	difference()
	{
		cube([x,y,z]);

		translate([x/2,y/2,z/2])
		% drawCylinder( y * 2, x * 0.4 );

		rotate([0,90,0]) 
		translate([-1 * x/2,1 * y/2,z/2])
		% drawCylinder( y * 2, x * 0.4 );
	}
}

module bug()
{
	difference()
	{
		cube([5,5,5]);

		translate([-1,-1,-1])
		% cube([2,2,8]);
	}

//		% cylinder(5, 3, 3, $fn=20);
}

bug();


//cubeWithHoles(5,5,5);
