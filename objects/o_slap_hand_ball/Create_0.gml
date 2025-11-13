// Inherit the parent event
event_inherited();

function base_name() {
	return "Slap Hand"
}

function base_color() {
	return BALL_COLORS.SLAP_HAND
}

function clone (_clone_data) {
	var _clone = clone_base(o_slap_hand_ball, _clone_data)
	_clone.knockback_stength = knockback_stength
	return _clone
}

color = base_color()
name = base_name()

get_credit = function () {
	return "Xebrax"	
}

add_weapon(o_slap_hand_weapon, 4)
