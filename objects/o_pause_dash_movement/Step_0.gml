if paused && owner.movable {
	owner.xspd = 0
	owner.yspd = -owner.grav
	
	angle += angle_shift
}

if !owner.movable {
	initial_pause = false
	paused = false
}