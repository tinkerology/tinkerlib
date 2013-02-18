
/********************************************************************
 * TinkerLib : Candle Holder
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *
 * This was designed to make a candlabra with PVC pipe.  This holder 
 * sits in an upright piece of pipe and a candle can be placed in
 * top (the flat side).
 *******************************************************************/

DETAIL=60;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;


module drawCandleHolderOrig()
{
	difference()
	{
		drawDoubleFlairedCylinder( 15, 7, 10, 10, 25, 10 );
		
		translate([0,0,-8])
		cylinder(16, 7, 8.5);
	}
}

rotate([0,180,0])
drawCandleHolderOrig();
