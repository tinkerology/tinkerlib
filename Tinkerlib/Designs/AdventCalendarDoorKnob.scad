
/********************************************************************
 * TinkerLib : Simple Rounded Knob
 * By Scott P Leslie (https://twitter.com/tinkerology)
 * Licensed Under Creative Commons Attributions Share Alike 
 * (http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
 *******************************************************************/

DETAIL=60;
RADIUS=4;
PEG_LENGTH=5;
PEG_RADIUS=1.5;

sphere(r=RADIUS, $fn=DETAIL);
translate([0,0,PEG_LENGTH-1])
cylinder(PEG_LENGTH, PEG_RADIUS, PEG_RADIUS, $fn=DETAIL);