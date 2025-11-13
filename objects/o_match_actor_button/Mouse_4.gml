if !disabled && !global.IN_MENU {
	var _current_team_index = array_get_index(global.ALL_TEAMS, match_actor.team)
	if _current_team_index != -1 {
		var next_index = _current_team_index % array_length(global.ALL_TEAMS)
		if (keyboard_check(vk_shift)) {
			next_index = (array_length(global.ALL_TEAMS) + _current_team_index - 1) % array_length(global.ALL_TEAMS)
		} else {
			next_index = (_current_team_index + 1) % array_length(global.ALL_TEAMS)
		}
		match_actor.team = global.ALL_TEAMS[next_index]	
	}
}
