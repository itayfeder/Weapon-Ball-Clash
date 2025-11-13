angle = (angle + rotation_speed) % 360

x_offset = lengthdir_x(owner.radius * weapon_distance, angle)
y_offset = lengthdir_y(owner.radius * weapon_distance, angle)

x = owner.x + x_offset
y = owner.y + y_offset

var ball_collision_list = ds_list_create()
if (!place_meeting(x, y, o_projectile) && !place_meeting(x, y, o_weapon) && instance_place_list(x, y, o_combat_ball, ball_collision_list, true) == 1) {
	ds_list_clear(collision_blacklist)
}
ds_list_destroy(ball_collision_list)

depth = before_ball ? owner.depth - 1 : owner.depth + 1

