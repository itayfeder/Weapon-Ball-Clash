if owner.movable {
	var original_speed = vector_to_polar(owner.xspd, owner.yspd)[0]

	var mouse_direction = point_direction(owner.x, owner.y, mouse_x, mouse_y)
	var effecting_speed = vector_to_cartesian(0.65, mouse_direction)

	owner.xspd += effecting_speed[0]
	owner.yspd += effecting_speed[1]
}