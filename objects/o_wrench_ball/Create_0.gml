// Inherit the parent event
event_inherited();

function base_name() {
	return "Wrench"
}

function base_color() {
	return BALL_COLORS.WRENCH
}

function clone (_clone_data) {
	var _clone = clone_base(o_wrench_ball, _clone_data)
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_wrench_weapon, 5)