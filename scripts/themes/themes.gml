function Theme(
		_background_color, _border_color, 
		_text_color, _inner_arena_color
) constructor {
	background = _background_color
	border = _border_color
	text = _text_color
	inner_arena = _inner_arena_color
}

global.THEME_DEFAULT = new Theme(
	make_color_rgb(253, 245, 231),
	c_black,
	c_black,
	c_white
)

global.THEME_DARK = new Theme(
	make_color_rgb(26, 26, 26),
	make_color_rgb(127, 127, 127),
	make_color_rgb(178, 178, 178),
	make_color_rgb(52, 52, 52)
)

global.ALL_THEMES = [
	global.THEME_DEFAULT,
	global.THEME_DARK
]

global.CURRENT_THEME = global.ALL_THEMES[0]
window_set_colour(global.CURRENT_THEME.background)