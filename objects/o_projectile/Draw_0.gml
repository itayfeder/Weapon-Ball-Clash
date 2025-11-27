var radius_ratio = self.owner.radius / global.BASE_RADIUS

image_xscale = (0.75 * radius_ratio) * projectile_scale
image_yscale = (0.75 * radius_ratio) * projectile_scale

image_angle = rotation

draw_sprite_ext(sprite_index, skin, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
