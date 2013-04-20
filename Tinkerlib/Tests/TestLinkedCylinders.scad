
/********************************************************************
 * TinkerLib : Test code
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <..\Tinkerlib\TinkerLib.scad>;

DETAIL=60;

module testDrawLinkedCylinderGroup1()
{
	drawLinkedCylinderGroup(30, [20,25,20,40,40], [-30, 0, 30,-60, 60], 3);
}

module testDrawLinkedRods1()
{
	drawLinkedRods(25, 15, 45, 3);
}

module testDrawLinkedTubes1()
{
	drawLinkedTubes(20, 40, 60, 4, 3);
}

scale([.5,1,1])
testDrawLinkedCylinderGroup1();
translate([20,0,0])
testDrawLinkedRods1();
translate([40,0,0])
testDrawLinkedTubes1();