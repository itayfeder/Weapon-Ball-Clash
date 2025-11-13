// Inherit the parent event
event_inherited();

blast_radius = 100
blast_damage = 1

on_collide_wall = function (_vertical) {
	fireball = instance_create_layer(x, y, "Others", o_fireball_explosion)
	fireball.owner = owner

	fireball.base_radius = blast_radius
	fireball.blast_damage = blast_damage
	
	instance_destroy()
}

on_projectile_hit_ball = function (_projectile, _other_ball) {
	if (_other_ball.id != owner.id) {
		fireball = instance_create_layer(_projectile.x, _projectile.y, "Others", o_fireball_explosion)
		fireball.owner = owner

		fireball.base_radius = blast_radius
		fireball.blast_damage = blast_damage
	}
}