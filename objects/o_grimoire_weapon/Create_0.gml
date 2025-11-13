// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("clone_hp", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("clone_hp", owner.clone_hp)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 0) && _other_ball.id != owner.id) {
		create_clone(owner, self, _other_ball, owner.clone_hp)
		owner.clone_hp += 1
	}
}

get_display_stats = function () {
	return ["Minion HP: " + string(owner.clone_hp)]
}

function create_clone(_owner, _weapon, _cloned_object, _hp) {
	var x_offset = lengthdir_x(_owner.radius, _weapon.angle)
	var y_offset = lengthdir_y(_owner.radius, _weapon.angle)

	var clone_x = x + x_offset
	var clone_y = y + y_offset
	
	var _velocity = vector_to_cartesian(10, _weapon.angle + 90 * sign(_weapon.rotation_speed))
	
	var _data_map = ds_map_create()
	ds_map_add(_data_map, "creator", _owner)
	ds_map_add(_data_map, "size_ratio", 0.8)
	ds_map_add(_data_map, "position", [clone_x, clone_y])
	ds_map_add(_data_map, "velocity", _velocity)
	ds_map_add(_data_map, "health", _hp)
	
	var _clone = _cloned_object.clone(_data_map)
	
	ds_list_add(owner.allies, _clone)
	ds_list_set(_clone.allies, 0, _owner)
	for (var i = 0; i < ds_list_size(owner.allies); i++) {
		if instance_exists(owner.allies[|i]) {
			for (var j = 0; j < ds_list_size(owner.allies); j++) {
				if instance_exists(owner.allies[|j]) {
					if list_contains_id(owner.allies[|i].allies, owner.allies[|j].id) == -1 {
						ds_list_add(owner.allies[|i].allies, owner.allies[|j])
					}
				}
			}
		}
		
	}

	ds_map_destroy(_data_map)
}