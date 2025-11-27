// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("arrows", 3)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("arrows", owner.arrows)
}

get_display_stats = function () {
	return ["Arrows: " + string(owner.arrows)]
}

function summon_arrow (_weapon) {
	x_offset = lengthdir_x(_weapon.owner.radius * _weapon.weapon_distance, _weapon.angle)
	y_offset = lengthdir_y(_weapon.owner.radius * _weapon.weapon_distance, _weapon.angle)

	arrow_x = x + x_offset
	arrow_y = y + y_offset
	
	arrow = instance_create_layer(arrow_x, arrow_y, "Projectiles", o_arrow_projectile)
	arrow.owner = _weapon.owner
	arrow.angle = _weapon.angle
	arrow.rotation = _weapon.angle
	arrow.xspd = lengthdir_x(arrow.projectile_speed, arrow.angle)
	arrow.yspd = lengthdir_y(arrow.projectile_speed, arrow.angle)
	
	arrow.skin = skin
}

if !disabled
	alarm[0] = global.BASE_ABILITY_COOLDOWN
