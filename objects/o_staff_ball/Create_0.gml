// Inherit the parent event
event_inherited();

function base_name() {
	return "Staff"
}

function base_color() {
	return BALL_COLORS.STAFF
}

function clone (_clone_data) {
	var _clone = clone_base(o_staff_ball, _clone_data)
	_clone.blast_damage = blast_damage
	_clone.blast_radius = blast_radius
	return _clone
}

color = base_color()
name = base_name()

weapon = add_weapon(o_staff_weapon, 5)
