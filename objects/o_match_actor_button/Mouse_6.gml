if !disabled && !global.IN_MENU {
	var skin_count = sprite_get_number(get_ball_icon(match_actor.ball_type))
	var next_index = match_actor.skin % skin_count
	if (keyboard_check(vk_shift)) {
		match_actor.skin = (skin_count + match_actor.skin - 1) % skin_count
	} else {
		match_actor.skin = (skin_count + match_actor.skin + 1) % skin_count
	}
}