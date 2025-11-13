// Inherit the parent event
event_inherited();

function base_name() {
	return "Anchor"
}

function base_color() {
	return BALL_COLORS.ANCHOR
}

function clone (_clone_data) {
	var _clone = clone_base(o_anchor_ball, _clone_data)
	_clone.weight = weight
	return _clone
}

color = base_color()
name = base_name()

get_credit = function () {
	return "abyssal_interitus"	
}

add_weapon(o_anchor_weapon, 2)
