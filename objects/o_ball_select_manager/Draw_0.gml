
if (active) {
	draw_set_alpha(0.5)
	draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false)
	
	draw_rectangle_colour(
		room_width / balls_in_row - row_length / 2, room_height / 2 - column_length / 2, 
		room_width / balls_in_row + row_length / 2, room_height / 2 + column_length / 2, 
		c_black, c_black, c_black, c_black, false
	)
	
	draw_rectangle_colour(
		room_width / balls_in_row * (balls_in_row - 1) - row_length / 2, room_height / 2 - column_length / 2, 
		room_width / balls_in_row * (balls_in_row - 1) + row_length / 2, room_height / 2 + column_length / 2, 
		c_black, c_black, c_black, c_black, false
	)
	
	if (viewed_figher_title != noone) {
		viewed_figher_title.draw(room_width / balls_in_row * (balls_in_row - 1), room_height / 2 - column_length / 2)
	}
	
	if (current_viewed_fighter != noone && current_viewed_fighter.get_credit() != noone) {
		scribble("Thanks to " + current_viewed_fighter.get_credit() + " for the concept!")
		.starting_format("f_impact", global.CURRENT_THEME.text)
		.scale(0.4)
		.align(fa_center, fa_middle)
		.wrap(row_length * 0.9)
		.draw(room_width / balls_in_row * (balls_in_row - 1), room_height / 2 + column_length / 3)
	}

	
	draw_set_alpha(1)
}