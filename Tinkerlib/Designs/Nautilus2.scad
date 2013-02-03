
SIZE=30;
WALL_THICKNESS=2;
HEIGHT=30;
TWIST=180;
DETAIL=20;
ELLIPSE=0.75;
BASE_HEIGHT=5;

function profile(index) = SIZE+(index*cos(index*9.5))/4;

module drawLayer(index)
{
	difference()
	{
		translate([0,0,index])
		cylinder(1,profile(index), profile(index+1), $fn=DETAIL);

		translate([0,0,index])
		cylinder(1.01,profile(index)-WALL_THICKNESS, profile(index+1)-WALL_THICKNESS, $fn=DETAIL);
	}
}

for ( i = [0 : HEIGHT] )
{
	rotate([0,(360/HEIGHT)*i,0])
	scale([ELLIPSE,1,1])
	drawLayer(i);
}
