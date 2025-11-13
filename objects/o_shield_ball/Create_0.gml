// Inherit the parent event
event_inherited();

function base_name() {
	return "Shield"
}

function base_color() {
	return BALL_COLORS.SHIELD
}

function clone (_clone_data) {
	var _clone = clone_base(o_shield_ball, _clone_data)
	_clone.bonus_width = bonus_width
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_shield_weapon, 5)