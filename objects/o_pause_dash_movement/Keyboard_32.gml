if owner.movable {
	if !initial_pause {
		paused = true
		alarm[0] = to_ticks(5)
		angle = irandom_range(0, 360)
	}
	initial_pause = true
}
