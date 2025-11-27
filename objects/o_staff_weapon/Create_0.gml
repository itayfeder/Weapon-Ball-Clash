// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("blast_damage", 1)
	_owner.create_stat("blast_radius", 100)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("blast_damage", owner.blast_damage)
	_clone_ball.set_stat("blast_radius", owner.blast_radius)
}

get_display_stats = function () {
	return ["Blast Damage: " + string(owner.blast_damage),
			"Blast Radius: " + string(owner.blast_radius)]
}

function summon_fireball (_weapon) {
	x_offset = lengthdir_x(_weapon.owner.radius * _weapon.weapon_distance + _weapon.owner.radius, _weapon.angle)
	y_offset = lengthdir_y(_weapon.owner.radius * _weapon.weapon_distance + _weapon.owner.radius, _weapon.angle)

	fireball_x = x + x_offset
	fireball_y = y + y_offset
	
	fireball = instance_create_layer(fireball_x, fireball_y, "Projectiles", o_fireball_projectile)
	fireball.owner = _weapon.owner
	fireball.angle = _weapon.angle
	fireball.rotation = _weapon.angle
	fireball.xspd = lengthdir_x(fireball.projectile_speed, fireball.angle)
	fireball.yspd = lengthdir_y(fireball.projectile_speed, fireball.angle)
	
	fireball.blast_damage = _weapon.owner.blast_damage
	fireball.blast_radius = _weapon.owner.blast_radius
	
	fireball.skin = skin
}

if !disabled
	alarm[0] = global.BASE_ABILITY_COOLDOWN
