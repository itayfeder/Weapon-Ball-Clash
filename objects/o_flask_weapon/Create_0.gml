// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("puddle_dps", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("puddle_dps", owner.puddle_dps)
}

get_display_stats = function () {
	return ["DPS: " + string_format(owner.puddle_dps, 0, 1)]
}

function summon_flask (_weapon) {
	x_offset = lengthdir_x(_weapon.owner.radius * _weapon.weapon_distance, _weapon.angle)
	y_offset = lengthdir_y(_weapon.owner.radius * _weapon.weapon_distance, _weapon.angle)

	flask_x = x + x_offset
	flask_y = y + y_offset
	
	flask = instance_create_layer(flask_x, flask_y, "Projectiles", o_flask_projectile)
	flask.owner = _weapon.owner
	flask.angle = _weapon.angle
	flask.rotation = _weapon.angle
	flask.xspd = lengthdir_x(flask.projectile_speed, flask.angle)
	flask.yspd = lengthdir_y(flask.projectile_speed, flask.angle)
	
	flask.puddle_dps = _weapon.owner.puddle_dps
	flask.skin = skin
}

if !disabled
	alarm[0] = global.BASE_ABILITY_COOLDOWN * 2
