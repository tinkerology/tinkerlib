

for ( h = [0 : 3 : 12 ])
{
	for ( i = [ 0 : 20 ] )
	{
		rotate([0,0,i*18])
		translate([0,h,h])
		cube([5+h,1,1]);
	}
}

/*
rotate([45,45,0])
cube([1,1,17]);

rotate([45,45,72])
cube([1,1,17]);

rotate([144,45,45])
cube([1,1,17]);

rotate([216,45,45])
cube([1,1,17]);

rotate([288,45,45])
cube([1,1,17]);
*/