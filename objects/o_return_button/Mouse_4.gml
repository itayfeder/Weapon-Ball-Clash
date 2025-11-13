if is_instanceof(global.CURRENT_MATCH, BracketMatch) {
	room_goto(r_tournament_display)
} else {
	room_goto(r_sandbox_select)
}
