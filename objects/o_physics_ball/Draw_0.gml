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