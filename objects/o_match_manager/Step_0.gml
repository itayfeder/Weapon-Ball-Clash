if global.CURRENT_MATCH.has_winner() && !winner_state {
	var _living = global.CURRENT_MATCH.living_balls()[0]
	_living.invulnerable = true
	winner_state = true
	alarm[0] = to_ticks(3)
}