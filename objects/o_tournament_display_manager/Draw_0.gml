
if (global.CURRENT_GAME != noone) {
	global.CURRENT_GAME.draw_bracket(self, x_offset, y_offset, contender_size)
}

if winner_state {
	draw_set_alpha(0.5)
	draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	
	draw_type_winner_title(global.CURRENT_GAME.get_winner().ball_type)
}