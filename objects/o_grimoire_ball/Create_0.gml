// Inherit the parent event
event_inherited();

function base_name() {
	return "Grimoire"
}

function base_color() {
	return BALL_COLORS.GRIMOIRE
}

function clone (_clone_data) {
	var _clone = clone_base(o_grimoire_ball, _clone_data)
	_clone.clone_hp = clone_hp
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_grimoire_weapon, 5)