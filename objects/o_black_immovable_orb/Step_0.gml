// "Inherit" the parent event
if (effected_by_gravity) {
	yspd += grav
}

if place_meeting(x + xspd, y, o_border) {
	if movement_engine != noone {
		movement_engine.on_collide_wall(false)
	}
	on_collide_wall_base(false)
	
	while !place_meeting(x + sign(xspd), y, o_border) {
		x += sign(xspd)
	}
	
	xspd *= -1
}

if place_meeting(x, y + yspd, o_border) {
	if movement_engine != noone {
		movement_engine.on_collide_wall(true)
	}
	on_collide_wall_base(true)
	
	while !place_meeting(x, y + sign(yspd), o_border) {
		y += sign(yspd)
	}
	yspd *= -1
}


x += xspd
y += yspd


for (var i = 0; i < ds_list_size(weapons); i++) {
	weapons[|i].on_ball_step()
}

invincibility_frames = max(invincibility_frames - 1, 0)

//if (hp <= 0 && !invulnerable) {
//	kill()	
//}