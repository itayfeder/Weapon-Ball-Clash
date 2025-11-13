// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("lifesteal", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("lifesteal", owner.lifesteal)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball)) {
		owner.deal_damage(_other_ball, owner.lifesteal)
		if (owner.take_damage(owner, -owner.lifesteal, BALL_COLORS.SCEPTER, 0) && _other_ball.id != owner.id) {
			owner.lifesteal += 0.5
		}
	}
}

get_display_stats = function () {
	return ["Lifesteal: " + string_format(owner.lifesteal, 0, 1)]
}
