
draw_rectangle_colour(0, 0, room_width, room_height / 2 - (middle_hole_size / 2), 
	global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, false)

draw_rectangle_colour(0, room_height / 2 + (middle_hole_size / 2), room_width, room_height, 
	global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, false)

draw_rectangle_colour(0, 0, room_width / 2 - (middle_hole_size / 2), room_height, 
	global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, false)

draw_rectangle_colour(room_width / 2 + (middle_hole_size / 2), 0, room_width, room_height, 
	global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, global.CURRENT_THEME.background, false)


if global.CURRENT_MATCH != noone {
	draw_ball_stats()	
}
