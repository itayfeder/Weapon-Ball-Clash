if global.CURRENT_GAME.has_winner() && !winner_state {
	winner_state = true
	alarm[0] = to_ticks(3)
}