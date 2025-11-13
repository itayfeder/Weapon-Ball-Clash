var background = layer_background_get_id(layer_get_id("Background"));
layer_background_blend(background, global.CURRENT_THEME.background)

global.CURRENT_GAME = noone
if (global.CURRENT_MATCH != noone) {
	global.CURRENT_MATCH.cleanup()	
}
global.CURRENT_MATCH = noone