collision_blacklist = ds_list_create()
skin = 0

on_weapon_scale_modify = function (_weapon_xscale, _weapon_yscale) {
	return [_weapon_xscale, _weapon_yscale]
}

on_initialize = function (_owner) {
	self.owner = _owner	
}

on_weapon_hit_projectile = function (_other_projectile) {
	
}

on_weapon_hit_weapon = function (_other_weapon) {
	
}

on_weapon_hit_ball = function (_other_ball) {
	
}

should_draw_echoes = function () {
	return false
}

can_take_damage = function (_attacker, _damage) {
	return true
}

on_collide_wall = function (_vertical) {
	
}

on_ball_step = function () {
	
}

get_display_stats = function () {
	return []
}

on_take_damage = function (_attacker, _damage) {
	
}

on_clone = function (_clone_ball) {
	
}
