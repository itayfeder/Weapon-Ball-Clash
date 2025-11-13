// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("attack_speed", 7)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("attack_speed", owner.attack_speed)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1) && _other_ball.id != owner.id) {
		owner.attack_speed = min(owner.attack_speed + 1, 100)
		rotation_speed = owner.attack_speed * sign(rotation_speed)
	}
}

get_display_stats = function () {
	return ["Attack Speed: " + string(owner.attack_speed)]
}