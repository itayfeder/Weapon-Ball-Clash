draw_hollow_rectangle(
	x_center - width / 2, y_center - height / 2,
	x_center + width / 2, y_center + height / 2,
	global.CURRENT_THEME.background, global.CURRENT_THEME.border, 10
)

scribble("Next Match")
	.starting_format("f_impact", global.CURRENT_THEME.text)
	.scale(1)
	.align(fa_center, fa_middle).draw(x, y)