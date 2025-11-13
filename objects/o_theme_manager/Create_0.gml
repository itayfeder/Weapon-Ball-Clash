
theme_button = instance_create_layer(room_width - 64, 64, "Buttons", o_theme_button)
theme_button.owner_manager = self

set_theme = function (theme_id) {
	global.CURRENT_THEME = global.ALL_THEMES[theme_id]

	var background = layer_background_get_id(layer_get_id("Background"));
	layer_background_blend(background, global.CURRENT_THEME.background)
}