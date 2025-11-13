// Inherit the parent event
event_inherited();

function base_name() {
	return "Spear"
}

function base_color() {
	return BALL_COLORS.SPEAR
}

function clone (_clone_data) {
	var _clone = clone_base(o_spear_ball, _clone_data)
	_clone.attack_damage = attack_damage
	_clone.bonus_length = bonus_length
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_spear_weapon, 5)