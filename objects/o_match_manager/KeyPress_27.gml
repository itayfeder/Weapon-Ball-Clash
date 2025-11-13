if !winner_state {
	pause_state = !pause_state
	if pause_state {
		surface_copy(surface, 0, 0, application_surface)
		instance_deactivate_all(true)
	
		if (return_button == noone) {
			return_button = instance_create_layer(x, y, "OverButtons", o_return_button)
			return_button.owner_manager = self
		}
	
	} else {
		instance_activate_all()	
	
		if (return_button != noone) {
			instance_destroy(return_button)
			return_button = noone
		}
	}
} else {
	return_after_finish()
}
