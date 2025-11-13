
if (pause_state || winner_state) {
	if (pause_state && surface != noone) {
		draw_surface(surface, 0, 0)	
	}
	
	draw_set_alpha(0.5)
	draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
	
	if (winner_state) {
		var _living = global.CURRENT_MATCH.living_balls()[0]
		
		draw_winner_title(_living)
	}
}
