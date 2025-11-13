formatted_title =  scribble(text)
			.starting_format("f_impact", global.CURRENT_THEME.text)
			.scale(1)
			.align(fa_center, fa_middle)

var text_width = formatted_title.get_bbox(x_center, y_center).width + 100
image_xscale = text_width / 2

draw_hollow_rectangle(
	x_center - text_width / 2, y_center - height / 2,
	x_center + text_width / 2, y_center + height / 2,
	global.CURRENT_THEME.background, global.CURRENT_THEME.border, 10
)

formatted_title.draw(x_center, y_center)