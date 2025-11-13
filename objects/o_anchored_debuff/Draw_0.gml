if target != noone {
	var radius_ratio = target.radius / global.BASE_RADIUS

	var prev_depth = depth

	gpu_set_depth(target.depth + 10)
	draw_sprite_ext(spr_anchor, 0, target.x, target.y + target.radius, 
		(0.75 * radius_ratio) * 1.25, (0.75 * radius_ratio) * 1.25,
		-90, c_white, 1
	)
	gpu_set_depth(prev_depth)
}
