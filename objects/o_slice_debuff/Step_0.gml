// Inherit the parent event
event_inherited();

if slices == 0 {
	target.remove_status_effect(self)
	instance_destroy()
	exit
}

if instance_exists(self) {
	ds_list_clear(new_tick_to_angle)
	for (var i = 0; i < ds_list_size(tick_to_angle); i++) {
		var current_value = tick_to_angle[|i]
		if current_value[0] - 1 != 0 {
			ds_list_add(new_tick_to_angle, [current_value[0] - 1, current_value[1]])
		}
	}

	if generator_tick == 0 {
		generator_tick = 6
		ds_list_add(new_tick_to_angle, [max_ticks, irandom_range(0, 360)])
		applier.deal_damage(target, 1, color, 2)
		slices -= 1
	}

	generator_tick -= 1
	ds_list_clear(tick_to_angle)
	ds_list_copy(tick_to_angle, new_tick_to_angle)
}
