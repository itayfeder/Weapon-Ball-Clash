
if (global.CURRENT_MATCH != noone) {
	global.CURRENT_MATCH.cleanup()
	global.CURRENT_MATCH = noone
}

global.CURRENT_MATCH = global.CURRENT_GAME.get_current_match()

room_goto(r_match)