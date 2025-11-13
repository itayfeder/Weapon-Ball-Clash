// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("rage", 1)
	_owner.create_stat("brass_knuckles_anchor", self)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("rage", owner.rage)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, owner.rage) && _other_ball.id != owner.id) {
		owner.rage = floor(max(owner.rage * 0.25, 1))
	}
}

on_take_damage = function (_attacker, _damage) {
	if owner.brass_knuckles_anchor.id == self.id {
		owner.rage += _damage
	}
}

on_weapon_hit_weapon = function (_other_weapon) {
	if owner.brass_knuckles_anchor.id != self.id {
		owner.brass_knuckles_anchor.rotation_speed *= -1
	}
}

get_display_stats = function () {
	return ["Rage: " + string(owner.rage)]
}
