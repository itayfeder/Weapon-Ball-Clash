// Inherit the parent event
event_inherited();

function base_name() {
	return "Katana"
}

function base_color() {
	return BALL_COLORS.KATANA
}

function clone (_clone_data) {
	var _clone = clone_base(o_katana_ball, _clone_data)
	_clone.slices = slices
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_katana_weapon, 5)