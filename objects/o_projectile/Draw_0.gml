var radius_ratio = self.owner.radius / global.BASE_RADIUS

image_xscale = (0.75 * radius_ratio) * projectile_scale
image_yscale = (0.75 * radius_ratio) * projectile_scale

image_angle = rotation

draw_self()