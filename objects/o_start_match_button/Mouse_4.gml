if !global.IN_MENU {
	var _new_match = new Match()

	for (var i = 0; i < ds_list_size(owner_manager.match_actors); i++) {
		_new_match.add_ball_actor(owner_manager.match_actors[|i].match_actor)	
	}

	if (global.CURRENT_MATCH != noone) {
		global.CURRENT_MATCH.cleanup()
		global.CURRENT_MATCH = noone
	}

	global.CURRENT_MATCH = _new_match
	global.CURRENT_GAME = noone
	room_goto(r_match)
}
