// Inherit the parent event
event_inherited();

rotation += 5 % 360

if (vector_to_polar(xspd, yspd)[0] < 2.25) {
	on_projectile_hit_ball(self, noone)
	instance_destroy()
}

xspd *= 0.925
yspd *= 0.925