// Inherit the parent event
event_inherited();

function base_name() {
	return "Flask"
}

function base_color() {
	return BALL_COLORS.FLASK
}

function clone (_clone_data) {
	var _clone = clone_base(o_flask_ball, _clone_data)
	_clone.puddle_dps = puddle_dps
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_flask_weapon, 4)
