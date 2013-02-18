
/********************************************************************
 * TinkerLib : Vase 4
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

SIZE=30;
WALL_THICKNESS=1;
HEIGHT=30;
LAYER_THICKNESS=1;
LAYERS=HEIGHT/LAYER_THICKNESS;
TWIST=360;
DETAIL=10;
ELLIPSE=0.750;
BASE_HEIGHT=5;

function profile(index) = SIZE+(index*cos(index*19.5))/8;

module tube(height, bottomWidth, topWidth, wallThickness )
{
	difference()
	{
		cylinder(height,bottomWidth,topWidth, $fn=DETAIL);

		cylinder(height,bottomWidth-wallThickness,topWidth-wallThickness, $fn=DETAIL);
	}
}

module drawShape( height, size1, size2 )
{
	scale([ELLIPSE,1,1])
	for ( i= [0:60] )
	{
		rotate([0,0,7.5*i])
		translate([0,size1,0])
		tube( 1,size1/20, size2/20, 1, $fn=DETAIL);
	}

//	scale([ELLIPSE,1,1])
//	cylinder(1,size1,size2, $fn=DETAIL);

//	rotate([0,0,90])
//	scale([ELLIPSE,1,1])
//	cylinder(1,size1,size2, $fn=DETAIL);
}


module drawLayer(index)
{
	//difference()
	{
		translate([0,0,index*LAYER_THICKNESS])
		drawShape(1,profile(index), profile(index+1), $fn=DETAIL);

		//translate([0,0,index*LAYER_THICKNESS])
		//drawShape(1.01,profile(index)-WALL_THICKNESS, profile(index+1)-WALL_THICKNESS, $fn=DETAIL);
	}
}

for ( i = [0 : LAYERS] )
{
	rotate([0,0,(TWIST/LAYERS)*i])
	drawLayer(i);
}
