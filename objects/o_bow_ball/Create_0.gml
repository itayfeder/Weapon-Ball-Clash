// Inherit the parent event
event_inherited();

function base_name() {
	return "Bow"
}

function base_color() {
	return BALL_COLORS.BOW
}

function clone (_clone_data) {
	var _clone = clone_base(o_bow_ball, _clone_data)
	_clone.arrows = arrows
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_bow_weapon, 4)
