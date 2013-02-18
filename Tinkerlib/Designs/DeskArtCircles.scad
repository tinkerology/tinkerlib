
/********************************************************************
 * TinkerLib : Vase 9
 * https://github.com/tinkerology/tinkerlib
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

include <..\Tinkerlib\TinkerLib.scad>;

VASE_DATA_SIZE=0;
VASE_DATA_WALL_THICKNESS=1;
VASE_DATA_HEIGHT=2;
VASE_DATA_LAYER_THICKNESS=3;
VASE_DATA_TWIST=4;
VASE_DATA_SHAPE_SCALE=5;
VASE_DATA_BASE_HEIGHT=6;
VASE_DATA_LIP_SIZE=7;
VASE_DATA_LIP_STYLE=8;
VASE_DATA_EQUASION=9;
VASE_DATA_LAYERS=10;
VASE_DATA_SIN_FACTOR=11;
VASE_DATA_COS_FACTOR=12;
VASE_DATA_EQUASION_DIVIDER=13;

VASE_LIP_STYLE_ROUNDED=0;

VASE_EQUASION_SIN=0;
VASE_EQUASION_COS=1;

VASE6_DATA=[
	30,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	120,			/* VASE_DATA_TWIST */
	0.650,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	-0.8,					/* VASE_DATA_SIN_FACTOR */
	-4.5,					/* VASE_DATA_COS_FACTOR */
	-10						/* VASE_DATA_EQUASION_DIVIDER */
	];

VASE7_DATA=[
	20,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	360,			/* VASE_DATA_TWIST */
	0.550,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	-2.2,					/* VASE_DATA_SIN_FACTOR */
	-4.5,					/* VASE_DATA_COS_FACTOR */
	-10						/* VASE_DATA_EQUASION_DIVIDER */
	];

VASE8_DATA=[
	30,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	180,			/* VASE_DATA_TWIST */
	0.750,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	3.2,						/* VASE_DATA_SIN_FACTOR */
	-3.5,					/* VASE_DATA_COS_FACTOR */
	10						/* VASE_DATA_EQUASION_DIVIDER */
	];

VASE9_DATA=[
	30,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	180,			/* VASE_DATA_TWIST */
	0.750,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	5.2,						/* VASE_DATA_SIN_FACTOR */
	-1.5,					/* VASE_DATA_COS_FACTOR */
	8						/* VASE_DATA_EQUASION_DIVIDER */
	];

VASE10_DATA=[
	30,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	180,			/* VASE_DATA_TWIST */
	0.750,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	0,						/* VASE_DATA_SIN_FACTOR */
	-1.5,					/* VASE_DATA_COS_FACTOR */
	8						/* VASE_DATA_EQUASION_DIVIDER */
	];

VASE11_DATA=[
	30,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	180,			/* VASE_DATA_TWIST */
	0.750,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	-4.5,					/* VASE_DATA_SIN_FACTOR */
	0,						/* VASE_DATA_COS_FACTOR */
	8						/* VASE_DATA_EQUASION_DIVIDER */
	];

VASE12_DATA=[
	30,			/* VASE_DATA_SIZE */
	1.2,			/* VASE_DATA_WALL_THICKNESS */
	100,			/* VASE_DATA_HEIGHT */
	1.0,			/* VASE_DATA_LAYER_THICKNESS */
	180,			/* VASE_DATA_TWIST */
	0.750,		/* VASE_DATA_SHAPE_SCALE */
	1,			/* VASE_DATA_BASE_HEIGHT */
	2,			/* VASE_DATA_LIP_SIZE */
	VASE_LIP_STYLE_ROUNDED,	/* VASE_DATA_LIP_STYLE */
	VASE_EQUASION_SIN,		/* VASE_DATA_EQUASION */
	100/1,					/* VASE_DATA_LAYERS */
	0.0,						/* VASE_DATA_SIN_FACTOR */
	-1.5,					/* VASE_DATA_COS_FACTOR */
	8						/* VASE_DATA_EQUASION_DIVIDER */
	];

DETAIL=120;

function profile2(index) = ((index)*sin((index)*-4.5))/8;
function profile(index,vaseData) =
	(
		index*sin((index)*vaseData[VASE_DATA_SIN_FACTOR]) +
		index*cos((index)*vaseData[VASE_DATA_COS_FACTOR])
	)
	/ vaseData[VASE_DATA_EQUASION_DIVIDER];

module drawShape( vaseData, height, size1, size2 )
{
	drawRadialCylinders( height, vaseData[VASE_DATA_SIZE], size1/10, size2/10, 30 );
}


module drawLayer(vaseData, index)
{
	difference()
	{
		translate([0,0,index*vaseData[VASE_DATA_LAYER_THICKNESS]])
		drawShape(vaseData, vaseData[VASE_DATA_LAYER_THICKNESS],
			vaseData[VASE_DATA_SIZE]+profile(index,vaseData),
			vaseData[VASE_DATA_SIZE]+profile(index+vaseData[VASE_DATA_LAYER_THICKNESS],vaseData) );

		translate([0,0,index*vaseData[VASE_DATA_LAYER_THICKNESS]])
		drawShape(vaseData, vaseData[VASE_DATA_LAYER_THICKNESS]+0.01,
			vaseData[VASE_DATA_SIZE]+profile(index,vaseData)-vaseData[VASE_DATA_WALL_THICKNESS],
			vaseData[VASE_DATA_SIZE]+profile(index+vaseData[VASE_DATA_LAYER_THICKNESS],vaseData)-vaseData[VASE_DATA_WALL_THICKNESS] );
	}
}

module drawVase(vaseData)
{
	// Draw the base
	cylinder(vaseData[VASE_DATA_BASE_HEIGHT]/2, vaseData[VASE_DATA_SIZE]+4, vaseData[VASE_DATA_SIZE]+2, center=true, $fn=DETAIL);
//	drawShape( vaseData, vaseData[VASE_DATA_BASE_HEIGHT]/2,
//		vaseData[VASE_DATA_SIZE]+2+profile(0,vaseData),
//		vaseData[VASE_DATA_SIZE]+2+profile(vaseData[VASE_DATA_BASE_HEIGHT]/2,vaseData));
	translate([0,0,vaseData[VASE_DATA_BASE_HEIGHT]/2])
	drawShape( vaseData, vaseData[VASE_DATA_BASE_HEIGHT]/2,
		vaseData[VASE_DATA_SIZE]+1+profile(vaseData[VASE_DATA_BASE_HEIGHT]/2,vaseData),
		vaseData[VASE_DATA_SIZE]+1+profile(vaseData[VASE_DATA_BASE_HEIGHT],vaseData));

	// Draw all the layers
	for ( i = [0 : vaseData[VASE_DATA_LAYERS]] )
	{
		rotate([0,0,(vaseData[VASE_DATA_TWIST]/vaseData[VASE_DATA_LAYERS])*i])
		drawLayer(vaseData, i);
	}

	// Draw the top
	translate([0,0,vaseData[VASE_DATA_HEIGHT]])
	drawTube(0.5, vaseData[VASE_DATA_SIZE]*1.15, vaseData[VASE_DATA_SIZE]*0.90);
}

drawBuildArea();

drawVase(VASE6_DATA);
//drawVase(VASE10_DATA);
//drawVase(VASE11_DATA);
