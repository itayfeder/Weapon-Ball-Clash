
if paused && owner.movable {
	var offset = vector_to_cartesian(owner.radius + 20, angle)
	var radius_ratio = owner.radius / global.BASE_RADIUS

	draw_sprite_ext(
		spr_debug_arrow, 0, 
		owner.x + offset[0], owner.y + offset[1],
		radius_ratio, radius_ratio,
		angle, owner.base_color(), 1
	)
}