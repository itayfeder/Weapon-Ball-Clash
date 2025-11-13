// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("bounces", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("bounces", owner.bounces)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1) && _other_ball.id != owner.id) {
		owner.bounces += 1
	}
}

get_display_stats = function () {
	return ["Bounces: " + string(owner.bounces)]
}

function summon_shuriken (_weapon) {
	x_offset = lengthdir_x(_weapon.owner.radius * _weapon.weapon_distance, _weapon.angle)
	y_offset = lengthdir_y(_weapon.owner.radius * _weapon.weapon_distance, _weapon.angle)

	arrow_x = x + x_offset
	arrow_y = y + y_offset
	
	shuriken = instance_create_layer(arrow_x, arrow_y, "Projectiles", o_shuriken_projectile)
	shuriken.owner = _weapon.owner
	shuriken.angle = _weapon.angle
	shuriken.rotation = _weapon.angle
	shuriken.xspd = lengthdir_x(shuriken.projectile_speed, shuriken.angle)
	shuriken.yspd = lengthdir_y(shuriken.projectile_speed, shuriken.angle)
	
	shuriken.self_bounces = _weapon.owner.bounces
}

if !disabled
	alarm[0] = global.BASE_ABILITY_COOLDOWN
