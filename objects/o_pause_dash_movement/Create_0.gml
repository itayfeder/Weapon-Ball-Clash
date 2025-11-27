// Inherit the parent event
event_inherited();

initial_pause = false
paused = false
angle = irandom_range(0, 360)
angle_shift = 3

on_ball_hit_ball = function (_other_ball) {
	paused = false
}

on_collide_wall = function (_vertical) {
	paused = false
}

launch = function () {
	if paused && owner.movable {
		var spd = 15
		var new_speed = vector_to_cartesian(spd, angle)
		owner.xspd = new_speed[0]
		owner.yspd = new_speed[1]
	}
	
	initial_pause = false
	paused = false
}