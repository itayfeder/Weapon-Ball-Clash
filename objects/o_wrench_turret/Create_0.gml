// Inherit the parent event
event_inherited();

randomize()
angle = irandom_range(0, 360)
owner = noone

get_mass = function () {
	return 1	
}

function summon_pellet () {
	x_offset = lengthdir_x(radius, angle)
	y_offset = lengthdir_y(radius, angle)

	pellet_x = x + x_offset
	pellet_y = y + y_offset
	
	pellet = instance_create_layer(pellet_x, pellet_y, "Projectiles", o_turret_pellet_projectile)
	pellet.owner = owner
	pellet.angle = angle
	pellet.rotation = angle
	pellet.xspd = lengthdir_x(pellet.projectile_speed, pellet.angle)
	pellet.yspd = lengthdir_y(pellet.projectile_speed, pellet.angle)

}

alarm[0] = to_ticks(0.5)

