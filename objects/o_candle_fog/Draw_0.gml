radius = 10 + (max_expansion_ticks - expanding_ticks) * (base_radius - 10) / max_expansion_ticks
draw_set_alpha(36 / 255)
draw_circle_colour(x, y, radius, owner.get_ball_color(), owner.get_ball_color(), false)
draw_set_alpha(1)