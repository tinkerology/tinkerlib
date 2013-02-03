
difference()
{
	cube([15,50,5], center=true);

	translate([0,-5.01,.1])
	cube([10,40,6], center=true);
}

translate([-5,-25,-2.5])
linear_extrude(height=5, $fn=40)
circle(3);

translate([5,-25,-2.5])
linear_extrude(height=5, $fn=40)
circle(3);