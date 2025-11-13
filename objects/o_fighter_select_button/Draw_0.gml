image_xscale = pixel_size
image_yscale = pixel_size

draw_sprite_ext(spr_icon_background_default, 0, x, y, 
	image_xscale, image_yscale, 0, global.CURRENT_THEME.inner_arena, 1
)

draw_sprite_ext(get_ball_icon(associated_weapon), 0, x, y, pixel_size, pixel_size, 0, c_white, 1)