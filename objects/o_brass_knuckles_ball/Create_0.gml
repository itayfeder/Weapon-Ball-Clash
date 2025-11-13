// Inherit the parent event
event_inherited();

function base_name() {
	return "Brass Knuckles"
}

function base_color() {
	return BALL_COLORS.BRASS_KNUCKLES
}

function clone (_clone_data) {
	var _clone = clone_base(o_anchor_ball, _clone_data)
	return _clone
}

color = base_color()
name = base_name()

get_credit = function () {
	return "Thecooking1"	
}

first = add_weapon(o_brass_knuckles_weapon, 5)
second = add_weapon(o_brass_knuckles_weapon, 5)
second.angle = first.angle - 75