// Inherit the parent event
event_inherited();

function base_name() {
	return "Laser"
}

function base_color() {
	return BALL_COLORS.LASER
}

function clone (_clone_data) {
	var _clone = clone_base(o_laser_ball, _clone_data)
	_clone.beam_width = beam_width
	_clone.beam_cooldown = beam_cooldown
	return _clone
}

color = base_color()
name = base_name()

add_weapon(o_laser_weapon, 2)