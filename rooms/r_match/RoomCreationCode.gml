var background = layer_background_get_id(layer_get_id("Background"));
layer_background_blend(background, global.CURRENT_THEME.background)

if (global.CURRENT_MATCH != noone) {
	global.CURRENT_MATCH.begin_match()
}

global.CURRENT_ROOM_MANAGER = o_match_manager
