if target != noone {
	for (var i = 0; i < ds_list_size(tick_to_angle); i++) {
		var current_value = tick_to_angle[|i]
		var tick = current_value[0]
		var angle = current_value[1]
		
		var length = (target.radius * 0.9 * 2 * (max_ticks - tick)) / max_ticks
		var x_offset = lengthdir_x(target.radius * 0.9, angle)
		var y_offset = lengthdir_y(target.radius * 0.9, angle)

		draw_rotated_rect(
			target.x + x_offset, target.y + y_offset, 
			angle + 180, length, 
			13, applier.get_ball_color(), 1
		)
	}
}