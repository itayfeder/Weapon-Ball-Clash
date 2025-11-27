var alpha = 1 * (fading_ticks / 10)

draw_set_alpha(alpha)
draw_circle_colour(x, y, radius, explosion_colors[skin], explosion_colors[skin], false)
draw_set_alpha(1)
draw_circle_colour(x, y, radius - 20, global.CURRENT_THEME.inner_arena, global.CURRENT_THEME.inner_arena, false)
