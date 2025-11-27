owner = noone

skin = 0
explosion_colors = [
	make_color_rgb(232, 168, 39),
	make_color_rgb(217, 87, 99)
]

expanding_ticks = 20
fading_ticks = 10
base_radius = 100
blast_damage = 1
radius = base_radius + 20 - expanding_ticks

collision_blacklist = ds_list_create()
colliding_balls = ds_list_create();
