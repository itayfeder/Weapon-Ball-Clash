// Inherit the parent event
event_inherited();

grav = 0
hp = 0

get_mass = function () {
	return (radius / 55)*3
}

on_collide_wall = function (_vertical) {
	var polar_speed = vector_to_polar(xspd, yspd)
	if (polar_speed[0] + 1 <= max_speed) {
		var cartesian_modified_speed = vector_to_cartesian(polar_speed[0] + 1, polar_speed[1])
		xspd = cartesian_modified_speed[0]
		yspd = cartesian_modified_speed[1]
	}
}

on_ball_hit_ball = function (_other_ball) {
	//var polar_speed = vector_to_polar(xspd, yspd)
	//var damage_value = polar_speed[0] * (max_damage / self.max_speed)
	//if (damage_value > max_damage) {
	//	damage_value = max_damage	
	//}
	//if (object_is_ancestor(_other_ball.object_index, o_combat_ball) && !are_allies(_other_ball) && deal_damage(_other_ball, damage_value) && _other_ball.id != self.id) {
		// max_speed += 1
		// max_damage += 0.25
	//}
}

should_draw_echoes = function () {
	return false
}

get_display_stats = function () {
	var polar_speed = vector_to_polar(xspd, yspd)
	var damage_value = polar_speed[0] * (max_damage / self.max_speed)
	if (damage_value > max_damage) {
		damage_value = max_damage	
	}
	
	return ["Damage Taken: " + string(-hp)]
}

function base_name() {
	return "Black \"Immovable\" Orb"
}

function base_color() {
	return BALL_COLORS.BLACK_IMMOVABLE_ORB
}

function clone (_clone_data) {
	var _clone = clone_base(o_black_immovable_orb, _clone_data)
	_clone.max_speed = max_speed
	_clone.max_damage = max_damage
	return _clone
}

color = base_color()
name = base_name()

max_speed = 12
max_damage = 4