// Inherit the parent event
event_inherited();

function base_name() {
	return "Scepter"
}

function base_color() {
	return BALL_COLORS.SCEPTER
}


function clone (_clone_data) {
	var _clone = clone_base(o_scepter_ball, _clone_data)
	_clone.lifesteal = lifesteal
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_scepter_weapon, 5)