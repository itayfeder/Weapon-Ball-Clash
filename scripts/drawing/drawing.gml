function create_gradient (_color_1, _color_2, _steps) {
	var gradient_colors = array_create(_steps)
	for(var i = 0; i < _steps; i++) {
		var mix_factor = _steps > 1 ? i / (_steps - 1) : 0
		
		var r_value = floor(color_get_red(_color_1) + (color_get_red(_color_2) - color_get_red(_color_1)) * mix_factor)
		var g_value = floor(color_get_green(_color_1) + (color_get_green(_color_2) - color_get_green(_color_1)) * mix_factor)
		var b_value = floor(color_get_blue(_color_1) + (color_get_blue(_color_2) - color_get_blue(_color_1)) * mix_factor)
		
		gradient_colors[i] = make_color_rgb(r_value, g_value, b_value)
	}
	
	if (_steps < 2) {
		gradient_colors[1] = _color_2
	}
	
	return gradient_colors
}

function draw_rotated_rect(_start_x, _start_y, _dir, _len, _width, _color, _alpha) {
	draw_sprite_ext(spr_pixel, 0,
					_start_x + lengthdir_x(_width / 2, _dir + 90),
					_start_y + lengthdir_y(_width / 2, _dir + 90),
					_len, _width, _dir, _color, _alpha
	)
}
