// Inherit the parent event
event_inherited();

on_weapon_scale_modify = function (_weapon_xscale, _weapon_yscale) {
	return [_weapon_xscale * 0.75, _weapon_yscale * (1.25 + owner.bonus_width)]
}

on_initialize = function (_owner) {
	_owner.create_stat("bonus_width", 0)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("bonus_width", owner.bonus_width)
}

on_weapon_hit_projectile = function (_other_projectile) {
	if (_other_projectile.owner.id != owner.id) {
		_other_projectile.xpsd *= -1
		_other_projectile.yspd *= -1
		_other_projectile.angle += 180
		if (!variable_instance_exists(_other_projectile, "previous_owner")) {
			_other_projectile.previous_owner = _other_projectile.owner
		}
		_other_projectile.owner = owner
	}
}

on_weapon_hit_weapon = function (_other_weapon) {
	_other_weapon.on_weapon_hit_ball(_other_weapon.owner)
	_handle_special_balls(_other_weapon)
	owner.bonus_width += 0.05
}

_handle_special_balls = function (_other_weapon) {
	if (_other_weapon.owner.object_index == o_wrench_ball) {
		_other_weapon.summon_turret(owner, _other_weapon.owner.radius, _other_weapon)
	}
	
	if (_other_weapon.owner.object_index == o_grimoire_ball) {
		_other_weapon.create_clone(owner, _other_weapon, _other_weapon.owner, _other_weapon.owner.clone_hp)
	}
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && _other_ball.object_index == o_unarmed_ball) {
		var _previous_speed = vector_to_polar(_other_ball.xspd, _other_ball.yspd)
		owner.deal_damage(_other_ball, _previous_speed[0] * (_other_ball.max_damage / _other_ball.max_speed))
		
		var _changed_speed = vector_to_cartesian(_previous_speed[0], _previous_speed[1] + 180)
		_other_ball.xspd = _changed_speed[0]
		_other_ball.yspd = _changed_speed[1]
		
		owner.bonus_width += 0.05
	}
}

get_display_stats = function () {
	return ["Shield Width: " + string_format(1 + owner.bonus_width, 0, 2)]
}

