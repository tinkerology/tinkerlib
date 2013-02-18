
/********************************************************************
 * TinkerLib : Vase 2
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

SIZE=30;
WALL_THICKNESS=2;
HEIGHT=80;
LAYER_THICKNESS=1;
LAYERS=HEIGHT/LAYER_THICKNESS;
TWIST=180;
ELLIPSE=0.750;
BASE_HEIGHT=5;

DETAIL=120;

function profile(index) = SIZE+(index*cos(index*9.5))/8;

module drawShape( height, size1, size2 )
{
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
		drawShape(1,profile(index), profile(index+1) );

		translate([0,0,index*LAYER_THICKNESS])
		drawShape(1.01,profile(index)-WALL_THICKNESS, profile(index+1)-WALL_THICKNESS );
	}
}

drawShape(2, profile(0), profile(1));
for ( i = [0 : LAYERS] )
{
	rotate([0,0,(TWIST/LAYERS)*i])
	drawLayer(i);
}
