
/********************************************************************
 * TinkerLib : Test code
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/


for ( h = [0 : 3 : 12 ])
{
	for ( i = [ 0 : 20 ] )
	{
		rotate([0,0,i*18])
		translate([0,h,h])
		cube([5+h,1,1]);
	}
}

