image_xscale = pixel_size
image_yscale = pixel_size

var _ball_color = match_actor.team == noone ? global.CURRENT_THEME.inner_arena : match_actor.team.color

draw_ball_icon(match_actor.ball_type, match_actor.skin, icon_size, x, y, _ball_color)
