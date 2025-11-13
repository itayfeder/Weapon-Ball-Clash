// Inherit the parent event
event_inherited();

function base_name() {
	return "Dagger"
}

function base_color() {
	return BALL_COLORS.DAGGER
}

function clone (_clone_data) {
	var _clone = clone_base(o_dagger_ball, _clone_data)
	_clone.attack_speed = attack_speed
	_clone.weapon.rotation_speed = attack_speed * sign(_clone.weapon.rotation_speed)
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_dagger_weapon, 7)
