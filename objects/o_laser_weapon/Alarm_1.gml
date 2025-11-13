
if my_laser != noone {
	instance_destroy(my_laser)
	my_laser = noone
}

laser_active = false
alarm[0] = owner.beam_cooldown