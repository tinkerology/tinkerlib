
SIZE=30;
WALL_THICKNESS=1;
HEIGHT=30;
LAYER_THICKNESS=1;
LAYERS=HEIGHT/LAYER_THICKNESS;
TWIST=180;
DETAIL=20;
ELLIPSE=0.750;
BASE_HEIGHT=5;

function profile(index) = SIZE+(index*cos(index*9.5))/8;

module drawShape( height, size1, size2 )
{
//	for ( i= [0:10] )
//	{
//	}

	scale([ELLIPSE,1,1])
	cylinder(1,size1,size2, $fn=DETAIL);

	rotate([0,0,90])
	scale([ELLIPSE,1,1])
	cylinder(1,size1,size2, $fn=DETAIL);
}


module drawLayer(index)
{
	difference()
	{
		translate([0,0,index*LAYER_THICKNESS])
		drawShape(1,profile(index), profile(index+1), $fn=DETAIL);

		translate([0,0,index*LAYER_THICKNESS])
		drawShape(1.01,profile(index)-WALL_THICKNESS, profile(index+1)-WALL_THICKNESS, $fn=DETAIL);
	}
}

for ( i = [0 : LAYERS] )
{
	rotate([0,0,(TWIST/LAYERS)*i])
	drawLayer(i);
}
