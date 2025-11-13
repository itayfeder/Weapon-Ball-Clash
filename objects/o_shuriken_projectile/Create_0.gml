// Inherit the parent event
event_inherited();

self_bounces = 0

on_projectile_hit_ball = function (_projectile, _other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1) && _other_ball.id != owner.id) {
		owner.add_to_stat("bounces", 1)
	}
}

on_collide_wall = function (_vertical) {
	if (self_bounces <= 0) {
		instance_destroy()
	}
	
	if place_meeting(x + xspd, y, o_border) {
		x -= xspd
		xspd *= -1
	}

	if place_meeting(x, y + yspd, o_border) {
		y -= yspd
		yspd *= -1
	}
	
	self_bounces -= 1
}

