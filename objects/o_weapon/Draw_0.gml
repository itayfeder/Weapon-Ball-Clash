var radius_ratio = self.owner.radius / global.BASE_RADIUS

var modified_scales = on_weapon_scale_modify(
	(0.75 * radius_ratio) * weapon_scale, 
	(0.75 * radius_ratio) * weapon_scale
)

image_xscale = modified_scales[0]
image_yscale = modified_scales[1] * (sign(rotation_speed) >= 0 ? 1 : -1)

image_angle = angle - SPRITE_ANGLE
draw_sprite_ext(sprite_index, skin, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
