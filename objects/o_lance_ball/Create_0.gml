// Inherit the parent event
event_inherited();

function base_name() {
	return "Lance"
}

function base_color() {
	return BALL_COLORS.LANCE
}

function clone (_clone_data) {
	var _clone = clone_base(o_lance_ball, _clone_data)
	_clone.joust_damage = joust_damage
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_lance_weapon, 4)
