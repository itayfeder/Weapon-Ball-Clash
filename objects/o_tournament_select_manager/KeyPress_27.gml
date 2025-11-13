if (o_ball_select_manager.active) {
	o_ball_select_manager.active = false	
	o_ball_select_manager.close_fighter_select()
} else {
	room_goto(r_main_menu)	
}
