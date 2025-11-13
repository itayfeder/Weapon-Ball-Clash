// Inherit the parent event
event_inherited();

my_laser = noone
laser_active = false

on_initialize = function (_owner) {
	_owner.create_stat("beam_width", 50)
	_owner.create_stat("beam_cooldown", 60)
	
	if !disabled
		alarm[0] = owner.beam_cooldown
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("beam_width", owner.beam_width)
	_clone_ball.set_stat("beam_cooldown", owner.beam_cooldown)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1) && _other_ball.id != owner.id) {
		owner.beam_width += 1
		owner.beam_cooldown = max(owner.beam_cooldown - 0.5, 1)
	}
}

get_display_stats = function () {
	return ["Beam Width: " + string_format(owner.beam_width, 0, 2),
			"Beam Cooldown: " + string_format(owner.beam_cooldown, 0, 1)]
}
