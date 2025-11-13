// Inherit the parent event
event_inherited();

function base_name() {
	return "Hammer"
}

function base_color() {
	return BALL_COLORS.HAMMER
}

function clone (_clone_data) {
	var _clone = clone_base(o_hammer_ball, _clone_data)
	_clone.max_spin = max_spin
	_clone.spin_damage_scale = spin_damage_scale
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_hammer_weapon, 2)