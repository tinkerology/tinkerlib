
/********************************************************************
 * TinkerLib : Shell necklace
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=30;
FAST=1;

include <..\Tinkerlib\TinkerLib.scad>;

module drawShell()
{
	cylinder(5,25,25,$fn=DETAIL);
}

drawShell();