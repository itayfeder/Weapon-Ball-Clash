
ds_list_clear(colliding_balls)
var count = collision_circle_list(x, y, radius, o_combat_ball, false, true, colliding_balls, true)
for (var i = 0; i < count; i++) {
	var enemy_instance = colliding_balls[|i]
	
	if (enemy_instance.id != owner.id) {
		if !ds_map_exists(ball_to_debuff, enemy_instance) {
			fogged_debuff = instance_create_layer(x, y, "StatusEffects", o_fogged_debuff)
			fogged_debuff.applier = self
			fogged_debuff.team = self.owner.team
			enemy_instance.add_status_effect(fogged_debuff)
		
			ds_map_add(ball_to_debuff, enemy_instance, fogged_debuff)	
		}
	}
}

var keys_array = array_create(ds_map_size(ball_to_debuff))
var values_array = array_create(ds_map_size(ball_to_debuff))
ds_map_keys_to_array(ball_to_debuff, keys_array)
ds_map_values_to_array(ball_to_debuff, values_array)
for (var i = 0; i < array_length(keys_array); i++) {
	var _key = keys_array[i]
	var _value = values_array[i]
	if _key != 0 && instance_exists(_key) && _key.id != owner.id && ds_list_find_index(colliding_balls, _key) == -1 {
		_key.remove_status_effect(_value)
		instance_destroy(_value)
		ds_map_delete(ball_to_debuff, _key)
	}
}


expanding_ticks = max(expanding_ticks - 1, 0)