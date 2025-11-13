// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("joust_damage", 2)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("joust_damage", owner.joust_damage)
}

jousting = false

on_weapon_hit_ball = function (_other_ball) {
	var dealt_damage = false
	if (!owner.are_allies(_other_ball)) {
		if jousting {
			dealt_damage =owner.deal_damage(_other_ball, owner.joust_damage)
		} else {
			dealt_damage = owner.deal_damage(_other_ball, 1)
		}
	}
	
	if (dealt_damage && _other_ball.id != owner.id) {
		owner.joust_damage += 2
	}
}

should_draw_echoes = function () {
	return jousting
}

can_take_damage = function (_attacker, _damage) {
	return !jousting
}

on_collide_wall = function (_vertical) {
	if jousting {
		alarm[1] = global.BASE_ABILITY_COOLDOWN * 1.2
		
		owner.effected_by_gravity = true
		owner.movable = true
		owner.invulnerable = false
		rotation_speed = 4 * choose(-1, 1)
		jousting = false
	}
}

on_ball_step = function () {
	if jousting {
		var movement_polar = vector_to_polar(owner.xspd, owner.yspd)
		var adjusted_speed = vector_to_cartesian(movement_polar[0] + 0.8, movement_polar[1])
		owner.xspd = adjusted_speed[0]
		owner.yspd = adjusted_speed[1]
	}
}

get_display_stats = function () {
	return ["Jousting Damage: " + string(owner.joust_damage)]
}

if !disabled
	alarm[1] = global.BASE_ABILITY_COOLDOWN * 1.2
