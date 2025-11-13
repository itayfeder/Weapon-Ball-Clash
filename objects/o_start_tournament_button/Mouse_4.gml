if !global.IN_MENU {
	if (global.CURRENT_MATCH != noone) {
		global.CURRENT_MATCH.cleanup()
		global.CURRENT_MATCH = noone
	}

	global.CURRENT_GAME.current_match = 1

	room_goto(r_tournament_display)
}
