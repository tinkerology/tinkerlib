
/********************************************************************
 * TinkerLib : Wobble Example for more organic shapes
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=120;
FAST=0;

include <..\Tinkerlib\TinkerLib.scad>;


module wobble(angle,xfactor,yfactor,zfactor)
{
	intersection()
	{
		child(0);

		rotate([xfactor*-1*angle,yfactor*-1*angle,zfactor*-1*angle])
		child(0);

		rotate([xfactor*1*angle,yfactor*1*angle,zfactor*1*angle])
		child(0);

		rotate([xfactor*-2*angle,yfactor*-2*angle,zfactor*-2*angle])
		child(0);

		rotate([xfactor*2*angle,yfactor*2*angle,zfactor*2*angle])
		child(0);

		rotate([xfactor*-3*angle,yfactor*-3*angle,zfactor*-3*angle])
		child(0);

		rotate([xfactor*3*angle,yfactor*3*angle,zfactor*3*angle])
		child(0);

		rotate([xfactor*-4*angle,yfactor*-4*angle,zfactor*-4*angle])
		child(0);

		rotate([xfactor*4*angle,yfactor*4*angle,zfactor*4*angle])
		child(0);

		rotate([xfactor*-5*angle,yfactor*-5*angle,zfactor*-5*angle])
		child(0);

		rotate([xfactor*5*angle,yfactor*5*angle,zfactor*5*angle])
		child(0);

		assign(angleFactor=6*angle)
		{
			rotate([xfactor*-1*angleFactor,yfactor*-1*angleFactor,
				zfactor*-1*angleFactor])
			child(0);

			rotate([xfactor*angleFactor,yfactor*angleFactor,
				zfactor*angleFactor])
			child(0);
		}
	}
}

module example1()
{
	difference()
	{
		sphere(10);

		translate([0,0,5])
		sphere(10,$fn=60);
	}

	translate([25,0,0])	
	wobble(2,1,1,1)
	difference()
	{
		sphere(10);

		translate([0,0,5])
		sphere(10,$fn=60);
	}
}

module example2()
{
	cube([10,10,10],center=true);

	translate([25,0,0])
	wobble(2,1,1,3)
	cube([10,10,10],center=true);
}

module example3()
{
	cylinder(30,5,5,center=true,$fn=DETAIL);

	translate([25,0,0])
	wobble(2,1,1,1)
	cylinder(30,5,5,center=true,$fn=DETAIL);
}

module example4()
{
	cube([10,10,30],center=true);

	translate([25,0,0])
	wobble(3,1,1,1)
	cube([10,10,30],center=true);
}

module drawWobbleGallery()
{
	example1();
	translate([0,25,0])
	example2();
	translate([0,50,0])
	example3();
	translate([0,75,0])
	example4();
}

drawWobbleGallery();
//example1();
//example2();
//example3();
//example4();
