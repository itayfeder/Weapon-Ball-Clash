
middle_hole_size = 768


draw_ball_stats = function () {
	var starting_x = 200
	var starting_y = room_height / 2 - 450
	
	var balls = global.CURRENT_MATCH.living_balls()
	
	var height_total = 900
	var left_half_count = ceil(array_length(balls) / 2)
    var spaces = height_total / (left_half_count + 1)

	var current_x = starting_x
	var current_y = starting_y + spaces
	
	var otherside = false
	
	var box_width = 0.9 * (room_width - height_total) / 2
	
	for (var i = 0; i < array_length(balls); i++) {
		if (i + 1) > left_half_count && !otherside {
			spaces = height_total / (array_length(balls) - left_half_count + 1)

            current_x = room_width - starting_x
            current_y = starting_y + spaces
            otherside = true
		}

		var title = scribble(balls[i].name + " [scale, 4][c_white][" + string(get_ball_icon(balls[i].object_index)) + "," + string(balls[i].skin) +"][/c][/scale]")
			.starting_format("f_impact", balls[i].get_ball_color())
			.scale(1)
			.align(fa_center, fa_middle)
			.sdf_outline(c_black, 3)
		
		title = get_text_adjusted_to_width(1, title, box_width * 0.9)
		var title_size = title.get_bbox(room_width, room_height).height
		
		var ball_data_lines = balls[i].get_display_stats()
		var box_height = title_size
		
		var formatted_ball_data_lines = array_create(array_length(ball_data_lines))
		
		for (var j = 0; j < array_length(ball_data_lines); j++) {
			var string_object = scribble(ball_data_lines[j])
				.starting_format("f_impact", balls[i].get_ball_color())
				.scale(0.8)
				.align(fa_center, fa_middle)
				.sdf_outline(c_black, 2)
			
			string_object = get_text_adjusted_to_width(0.8, string_object, box_width * 0.95)
			
			box_height += string_object.get_bbox(room_width, room_height).height
			formatted_ball_data_lines[j] = string_object
		}
		
		var y_position = current_y + title_size / 2 - box_height / 2
		
		draw_set_alpha(0.25)
		draw_rectangle_colour(
			current_x - box_width / 2, current_y - box_height / 2, 
			current_x + box_width / 2, current_y + box_height / 2, 
			c_black, c_black, c_black, c_black, false
		)
		draw_set_alpha(1)
		
		title.draw(current_x, current_y - box_height / 2)
		
		for (var j = 0; j < array_length(formatted_ball_data_lines); j++) {
			var string_object = formatted_ball_data_lines[j]
			var line_size = string_object.get_bbox(room_width, room_height).height

			y_position += line_size / 2
			
			string_object.draw(current_x, y_position)
			y_position += line_size / 2
		}
		
		current_y += spaces
	}
}
