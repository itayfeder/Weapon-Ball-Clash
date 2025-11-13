// Inherit the parent event
event_inherited();

function base_name() {
	return "Scythe"
}

function base_color() {
	return BALL_COLORS.SCYTHE
}

function clone (_clone_data) {
	var _clone = clone_base(o_scythe_ball, _clone_data)
	_clone.poison_damage = poison_damage
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_scythe_weapon, 5)