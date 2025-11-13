collision_blacklist = ds_list_create()

xpsd = 0
yspd = 0
angle = 0
rotation = 0

on_collide_wall = function (_vertical) {
	instance_destroy()
}

on_projectile_hit_ball = function (_projectile, _other_ball) {
	
}