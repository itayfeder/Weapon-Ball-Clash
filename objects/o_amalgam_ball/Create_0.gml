// Inherit the parent event
event_inherited();

function base_name() {
	return "Amalgam"
}

function base_color() {
	return BALL_COLORS.UNARMED
}

function clone (_clone_data) {
	var _clone = clone_base(o_amalgam_ball, _clone_data)
	return _clone
}

color = base_color()
name = base_name()

add_weapon(o_sword_weapon, 5)
add_weapon(o_bow_weapon, 3)

