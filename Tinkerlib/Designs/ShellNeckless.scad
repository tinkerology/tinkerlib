DETAIL=30;
FAST=1;

include <TinkerLib.scad>;

module drawShell()
{
	cylinder(5,25,25,$fn=DETAIL);
}

drawShell();