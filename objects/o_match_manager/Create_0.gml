pause_state = false
winner_state = false
surface = surface_create(room_width, room_height)

return_button = noone

return_after_finish = function () {
	if is_instanceof(global.CURRENT_MATCH, BracketMatch) {
		var bracket = global.CURRENT_GAME
		var match_data = bracket.get_current_match()
		winning_ball_index = 0
		for (var i = 0; i < ds_list_size(match_data.balls); i++) {
			var ball = match_data.balls[|i]
			if ball.ball_type == global.CURRENT_MATCH.living_balls()[0].object_index {
				winning_ball_index = i
				break
			}
		}
		
		bracket.set_match_winner(winning_ball_index + 1)
		bracket.matches_per_round[bracket.current_round - 1][(bracket.current_match - 1) % bracket.matches_this_round][winning_ball_index] = noone
		bracket.next_match()
		
		global.CURRENT_GAME = bracket
		match_data.cleanup()
		room_goto(r_tournament_display)	
		
	} else {
		room_goto(r_sandbox_select)
	}
}
