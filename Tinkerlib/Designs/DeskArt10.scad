
SIZE=30;
WALL_THICKNESS=2.4;
HEIGHT=100;
LAYER_THICKNESS=1;
LAYERS=HEIGHT/LAYER_THICKNESS;
TWIST=180;
ELLIPSE=0.750;
BASE_HEIGHT=1;

DETAIL=120;

function profile(index) = SIZE+((index*LAYER_THICKNESS)*sin((index*LAYER_THICKNESS)*-4.5))/8;

module drawShape( height, size1, size2 )
{
	scale([ELLIPSE,1,1])
	cylinder(height,size1,size2, $fn=DETAIL);

	rotate([0,0,90])
	scale([ELLIPSE,1,1])
	cylinder(height,size1,size2, $fn=DETAIL);
}


module drawLayer(index)
{
	difference()
	{
		translate([0,0,index*LAYER_THICKNESS])
		drawShape(LAYER_THICKNESS,profile(index), profile(index+LAYER_THICKNESS) );

		translate([0,0,index*LAYER_THICKNESS])
		drawShape(LAYER_THICKNESS+0.01,profile(index)-WALL_THICKNESS, profile(index+LAYER_THICKNESS)-WALL_THICKNESS );
	}
}

drawShape(BASE_HEIGHT, profile(0), profile(BASE_HEIGHT));
for ( i = [0 : LAYERS] )
{
	rotate([0,0,(TWIST/LAYERS)*i])
	drawLayer(i);
}
