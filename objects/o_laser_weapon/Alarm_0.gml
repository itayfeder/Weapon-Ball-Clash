
if my_laser == noone {
	my_laser = instance_create_layer(x, y, "Others", o_laser_beam)
	my_laser.owner = self
	my_laser.beam_width = owner.beam_width
}

laser_active = true
alarm[1] = to_ticks(2)