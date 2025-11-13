// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("max_spin", 1)
	_owner.create_stat("spin_damage_scale", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("max_spin", owner.max_spin)
	_clone_ball.set_stat("spin_damage_scale", owner.spin_damage_scale)
}

on_weapon_hit_ball = function (_other_ball) {
	rotation_damage = abs(rotation_speed) * (owner.spin_damage_scale / (owner.max_spin * 2))
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, rotation_damage) && _other_ball.id != owner.id) {
		owner.max_spin += 1
		owner.spin_damage_scale += 0.5
		rotation_speed = 0.15 * sign(rotation_speed)
	}
}

get_display_stats = function () {
	var rotation_damage = abs(rotation_speed) * (owner.spin_damage_scale / (owner.max_spin * 2))
	
	return ["Max Spin: " + string(owner.max_spin),
			"Damage/Spin: " + string_format(rotation_damage, 0, 0)]
}

on_ball_step = function () {
	if (abs(rotation_speed) < 2 * owner.max_spin) {
		rotation_speed += 0.15 * sign(rotation_speed)
	}
}
