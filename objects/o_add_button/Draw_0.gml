pixel_size = icon_size / 16

image_xscale = pixel_size
image_yscale = pixel_size

draw_hollow_rectangle(
	x - icon_size / 2, y - icon_size / 2,
	x + icon_size / 2, y + icon_size / 2,
	global.CURRENT_THEME.background, global.CURRENT_THEME.border, pixel_size
)

draw_sprite_ext(spr_plus_button, 0, x, y, 
	image_xscale, image_yscale, 0, global.CURRENT_THEME.text, 1
)
