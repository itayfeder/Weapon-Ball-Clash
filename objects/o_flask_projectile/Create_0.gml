// Inherit the parent event
event_inherited();

puddle_dps = 1

on_collide_wall = function (_vertical) {
	on_projectile_hit_ball(self, noone)
	instance_destroy()
}

on_projectile_hit_ball = function (_projectile, _other_ball) {
	puddle = instance_create_layer(_projectile.x, _projectile.y, "Others", o_flask_puddle)
	puddle.owner = owner
	puddle.team = owner.team

	puddle.puddle_dps = puddle_dps
}
