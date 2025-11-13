// Inherit the parent event
event_inherited();

function base_name() {
	return "Shuriken"
}

function base_color() {
	return BALL_COLORS.SHURIKEN
}

function clone (_clone_data) {
	var _clone = clone_base(o_shuriken_ball, _clone_data)
	_clone.bounces = bounces
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_shuriken_weapon, 4)
