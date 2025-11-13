// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("fog_size", 100)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("fog_size", owner.fog_size)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1)) {
		fog = instance_create_depth(x, y, layer_get_depth("Balls") - 50, o_candle_fog)
		fog.owner = owner
		fog.base_radius = owner.fog_size

		if (_other_ball.id != owner.id) {
			owner.fog_size += 5
		}
	}
}

get_display_stats = function () {
	return ["Fog Size: " + string(owner.fog_size)]
}