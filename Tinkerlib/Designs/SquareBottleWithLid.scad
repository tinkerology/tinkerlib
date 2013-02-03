
SIZE=30;
WALL_THICKNESS=1;
HEIGHT=30;
LAYER_THICKNESS=1;
LAYERS=HEIGHT/LAYER_THICKNESS;
TWIST=0;
DETAIL=60;
ELLIPSE=0.750;
BASE_HEIGHT=5;
TOP_HEIGHT=5;
TOP_RADIUS=12;

function profile(index) = SIZE;

module drawShape( height, size1, size2 )
{
	cube([size1,size2,height], center=true);
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

module drawBottom()
{
	cube( [SIZE,SIZE,BASE_HEIGHT], center=true);
}

module drawTopTransition()
{
}

module drawTopThreads()
{
	translate([0,0,HEIGHT+BASE_HEIGHT/2])
	difference()
	{
		cylinder( TOP_HEIGHT, TOP_RADIUS, TOP_RADIUS, center=true, $fn=DETAIL );
		cylinder( TOP_HEIGHT, TOP_RADIUS-WALL_THICKNESS, TOP_RADIUS-WALL_THICKNESS, center=true, $fn=DETAIL );
	}


}

module drawBottle()
{
	drawBottom();

	for ( i = [0 : LAYERS] )
	{
		//rotate([0,0,(TWIST/LAYERS)*i])
		drawLayer(i);
	}

	drawTopTransition();

	drawTopThreads();
}

drawBottle();