// Inherit the parent event
event_inherited();

on_weapon_scale_modify = function (_weapon_xscale, _weapon_yscale) {
	return [_weapon_xscale * (1 + 1 * owner.bonus_length), _weapon_yscale]
}

on_initialize = function (_owner) {
	_owner.create_stat("attack_damage", 1)
	_owner.create_stat("bonus_length", 0)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("attack_damage", owner.attack_damage)
	_clone_ball.set_stat("bonus_length", owner.bonus_length)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, owner.attack_damage) && _other_ball.id != owner.id) {
		owner.attack_damage += 0.5
		owner.bonus_length += 0.1
	}
}

get_display_stats = function () {
	return ["Attack Damage: " + string_format(owner.attack_damage, 0, 1),
			"Length: " + string_format(1 + 2.5 * owner.bonus_length, 0, 2)]
}