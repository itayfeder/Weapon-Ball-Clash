
if (should_draw_echoes()) {
	for (var i = 0; i < ds_list_size(echoes); i++) {
		var alpha = 1 * (i / ds_list_size(echoes))
		var data = echoes[|i]
		draw_set_alpha(alpha)
		draw_circle_colour(data[0], data[1], radius * 0.925, get_ball_color(), get_ball_color(), false)
		draw_set_alpha(1)
	}	
}

if (invincibility_frames <= 0) {
	circle_color = get_ball_color()
} else {
	var gradient = create_gradient(get_ball_color(), last_damage_color, 5)
	circle_color = gradient[invincibility_frames - 1]
}

// "Inherit" the parent event
var original_width = sprite_get_width(sprite_index);
var original_height = sprite_get_height(sprite_index);
var target_diameter = 2 * radius;
var scale_factor = target_diameter / max(original_width, original_height);
image_xscale = scale_factor;
image_yscale = scale_factor;

draw_circle_colour(x, y, radius, c_black, c_black, false)
draw_circle_colour(x, y, radius * 0.925, circle_color, circle_color, false)

// draw_self()

// draw_sprite_ext(spr_arrow, 0, x, y, 1, 1, point_direction(x, y, x + xspd, y + yspd), c_white, 1)

if !disabled {
	if (!invulnerable) {
		draw_set_alpha(1)
		//draw_set_font(f_impact)
		//draw_set_halign(fa_center)
		//draw_set_valign(fa_middle)
		//draw_text_scribble(x, y, "[c_black][scale,0.8]" + string(ceil(hp)))	
	} else {
		draw_sprite_ext(spr_invincibility_shield_icon, 1, x, y, 0.125, 0.125, 0, c_black, 1)
	}
}
