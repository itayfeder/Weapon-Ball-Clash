// Inherit the parent event
event_inherited();

function base_name() {
	return "Sword"
}

function base_color() {
	return BALL_COLORS.SWORD
}

function clone (_clone_data) {
	var _clone = clone_base(o_sword_ball, _clone_data)
	_clone.attack_damage = attack_damage
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_sword_weapon, 5)