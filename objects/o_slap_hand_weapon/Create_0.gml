// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("knockback_stength", 4)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("knockback_stength", owner.knockback_stength)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1)) {
		var polar_speed = vector_to_polar(_other_ball.xspd, _other_ball.yspd)
		var slap_angle = angle + 90 * sign(rotation_speed)
		
		slapped_debuff = instance_create_layer(x, y, "StatusEffects", o_slapped_debuff)
		slapped_debuff.max_extra_movement = owner.knockback_stength
		slapped_debuff.extra_movement = owner.knockback_stength
		slapped_debuff.original_speed = polar_speed[0]
		slapped_debuff.applier = owner
		_other_ball.add_status_effect(slapped_debuff)
		
		polar_speed[0] += owner.knockback_stength
		var cartesian_speed = vector_to_cartesian(polar_speed[0], slap_angle)
		if _other_ball.movable {
			_other_ball.xspd = cartesian_speed[0]
			_other_ball.yspd = cartesian_speed[1]
		}
		
		if (_other_ball.id != owner.id) {
			owner.knockback_stength += 0.25
		}
	}
}

get_display_stats = function () {
	return ["Knockback: " + string_format(owner.knockback_stength, 0, 2)]
}