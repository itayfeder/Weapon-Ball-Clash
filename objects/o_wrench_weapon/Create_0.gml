// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("turrets", 0)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1)) {
		if (_other_ball.id != owner.id) {
			summon_turret(owner, owner.radius, self)
			owner.turrets += 1	
		}
	}
}

get_display_stats = function () {
	return ["Turrets: " + string(owner.turrets)]
}

function summon_turret (_owner, _distance, _weapon) {
	x_offset = lengthdir_x(_distance * _weapon.weapon_distance + _distance, _weapon.angle)
	y_offset = lengthdir_y(_distance * _weapon.weapon_distance + _distance, _weapon.angle)

	turret_x = x + x_offset
	turret_y = y + y_offset
	
	turret = instance_create_layer(turret_x, turret_y, "Others", o_wrench_turret)
	turret.owner = _owner

}
