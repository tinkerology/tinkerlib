
/********************************************************************
 * TinkerLib : Versailles pattern tile layout (incomplete)
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

GROUT_SIZE=.125;
PATTERN_WIDTH=48+GROUT_SIZE*3;
PATTERN_LENGTH=48+GROUT_SIZE*3;
COLORS=[ "red", "blue", "green" ];

ROOM_WIDTH=11.5*12;
ROOM_LENGTH=15*12;
ROOM_HEIGHT=8*12;

module drawTile(width,height)
{
	cube([width,height,.25]);
}

module drawVersailles()
{
	rotate([0,0,-90])
	{
	drawTile(8,8);
	
	translate([8+GROUT_SIZE,0,0])
	drawTile(16,24);

	translate([16+GROUT_SIZE*2,24+GROUT_SIZE*2,0])
	drawTile(8,8);

	translate([-8-GROUT_SIZE,8+GROUT_SIZE,0])
	drawTile(16,16);

	translate([-16-GROUT_SIZE*2,8+GROUT_SIZE,0])
	drawTile(8,8);

	translate([-24-GROUT_SIZE*3,16+GROUT_SIZE*2,0])
	drawTile(16,16);

	translate([-24-GROUT_SIZE*3,0,0])
	drawTile(8,16);

	translate([-16-GROUT_SIZE*1,-8-GROUT_SIZE,0])
	drawTile(16,16);

	translate([-16-GROUT_SIZE*2,-16-GROUT_SIZE*2,0])
	drawTile(8,8);

	translate([-8-GROUT_SIZE*1,-24-GROUT_SIZE*2,0])
	drawTile(24,16);

	translate([0,-8-GROUT_SIZE*1,0])
	drawTile(16,8);

	translate([16+GROUT_SIZE*2,-16-GROUT_SIZE*1,0])
	drawTile(16,16);
	}
}

translate([-1*ROOM_WIDTH/2,-1*ROOM_LENGTH/2,0])
%cube([ROOM_WIDTH,ROOM_LENGTH,ROOM_HEIGHT]);

xCount=3;
yCount=4;
xSpacing=PATTERN_WIDTH;
ySpacing=PATTERN_LENGTH;

translate([-1*ROOM_WIDTH/2+PATTERN_WIDTH/2,-1*ROOM_LENGTH/2+PATTERN_LENGTH/2,0])
for ( x = [ 0 : xCount-1 ] )
{
	for ( y= [ 0 : yCount-1 ] )
	{
		color(COLORS[(x+y)%3])
		translate([x*xSpacing, y*ySpacing, 0])
		drawVersailles();
	}
}

