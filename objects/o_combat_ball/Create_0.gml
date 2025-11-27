// Inherit the parent event
event_inherited();

randomize()
if !disabled {
	xspd = irandom_range(-20, 20)
	yspd = irandom_range(-20, 20)
}

weapons = ds_list_create()
status_effects = ds_list_create()
allies = ds_list_create()

team = noone

echoes = ds_list_create()
alarm[11] = 2

on_ball_hit_ball_base = function (_other_ball) {
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		status_effects[|i].on_ball_hit_ball(_other_ball)
	}
	on_ball_hit_ball(_other_ball)
}

on_collide_wall_base = function (_vertical) {
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		status_effects[|i].on_collide_wall(_vertical)
	}
	on_collide_wall(_vertical)
}

can_take_damage = function (_attacker, _damage) {
	if invulnerable {
		return false
	}
	for (var i = 0; i < ds_list_size(weapons); i++) {
		if !weapons[|i].can_take_damage(_attacker, _damage) {
			return false	
		}
	}
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		if !status_effects[|i].can_take_damage(_attacker, _damage) {
			return false	
		}
	}
	return true
}

should_draw_echoes = function () {
	for (var i = 0; i < ds_list_size(weapons); i++) {
		if weapons[|i].should_draw_echoes() {
			return true	
		}
	}
	return false	
}

on_collide_wall = function (_vertical) {
	for (var i = 0; i < ds_list_size(weapons); i++) {
		weapons[|i].on_collide_wall(_vertical)
	}
}

on_ball_hit_ball = function (_other_ball) {
	
}

deal_damage = function (_target, _damage,_damage_color = c_white, _invincibility_frames = 5) {
	return _target.take_damage(self, _damage, _damage_color, _invincibility_frames)
}

take_damage = function (_attacker, _damage, _damage_color, _invincibility_frames) {
	if (!can_take_damage(_attacker, _damage)) { return false }
	if (invincibility_frames > 0) { return false }
	var true_damage = _damage
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		true_damage = status_effects[|i].calculate_damage(_attacker, true_damage) 
	}
	
	hp -= true_damage
	last_damage_color = _damage_color
	invincibility_frames = _invincibility_frames
	
	on_take_damage(_attacker, _damage)
	
	return true
}

on_take_damage = function (_attacker, _damage) {
	for (var i = 0; i < ds_list_size(weapons); i++) {
		weapons[|i].on_take_damage(_attacker, _damage)
	}
}

kill = function () {
	if !disabled {
		var _death_particle = o_particle_manager.get_particle(PARTICLES.DEATH)
		part_type_colour1(_death_particle, get_ball_color())
	
		part_particles_create(global.PARTICLE_SYSTEM, x, y, _death_particle, 40)
	
		for (var i = 0; i < ds_list_size(allies); i++) {
			if (instance_exists(allies[|i])) {
				var _ally_index = list_contains_id(allies[|i].allies, id)
				ds_list_delete(allies[|i].allies, _ally_index)
			}
		}
	}
	
	for (var i = 0; i < ds_list_size(weapons); i++) {
		instance_destroy(weapons[|i])
	}
	
	if movement_engine != noone {
		instance_destroy(movement_engine)	
	}
	
	instance_destroy()
}

add_weapon = function (_weapon_obj, _rotation_speed) {
	var _weapon = instance_create_layer(x, y, layer, _weapon_obj, {
		disabled: disabled
	})
	_weapon.angle = irandom_range(0, 360)
	_weapon.rotation_speed = _rotation_speed * choose(-1, 1)
	_weapon.owner = self
	_weapon.on_initialize(self)

	_weapon.skin = variable_instance_exists(self.id, "skin") ? self.skin : 0
	
	ds_list_add(weapons, _weapon)
	
	return _weapon
	
}

create_stat = function (_stat_name, _initial_value) {
	if (!variable_instance_exists(self, _stat_name)) {
		variable_instance_set(self, _stat_name, _initial_value)
	}
}

add_to_stat = function (_stat_name, _amount) {
	if (variable_instance_exists(self, _stat_name)) {
		var _original_value = variable_instance_get(self, _stat_name)
		variable_instance_set(self, _stat_name, _original_value + _amount)
	} else {
		variable_instance_set(self, _stat_name, _amount)
	}
}

set_stat = function (_stat_name, _amount) {
	variable_instance_set(self, _stat_name, _amount)
}

get_ball_color = function () {
	return team != noone ? team.color : color
}

override_draw_over = function () {
	return false
}

function is_same_effect(_first, _second) {
	if !instance_exists(_first) || !instance_exists(_second) return false
	return _first.object_index == _second.object_index && _first.applier.id == _second.applier.id
}

get_status_effect = function (_effect) {
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		var current_effect = status_effects[|i];
		if (is_same_effect(current_effect, _effect)) {
			return current_effect
		}
	}
	return noone
}

has_status_effect = function (_effect) {
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		var current_effect = status_effects[|i];
		if (is_same_effect(current_effect, _effect)) {
			return true	
		}
	}
	return false
}

remove_status_effect = function (_effect) {
	var new_status_effect_list = ds_list_create()
	for (var i = 0; i < ds_list_size(status_effects); i++) {
		var current_effect = status_effects[|i];
		if not (is_same_effect(current_effect, _effect)) {
			ds_list_add(new_status_effect_list, current_effect)	
		} else {
			instance_destroy(current_effect)	
		}
	}
	ds_list_copy(status_effects, new_status_effect_list)
	ds_list_destroy(new_status_effect_list)
}

add_status_effect = function (_effect) {
	if has_status_effect(_effect) {
		remove_status_effect(_effect)
	}
	ds_list_add(status_effects, _effect)
	_effect.target = self
}

are_allies = function (_other) {
	if team != noone {
		if team.same_team(_other.team) {
			return true
		}
	}
	if (!instance_exists(_other) || !instance_exists(self)) {
		return false
	}
	return list_contains_id(_other.allies, self.id) != -1 || list_contains_id(self.allies, _other.id) != -1
}

get_display_stats = function () {
	var _stats = ds_list_create()
	for (var i = 0; i < ds_list_size(weapons); i++) {
		var _weapon_stats = weapons[|i].get_display_stats()
		for (var j = 0; j < array_length(_weapon_stats); j++) {
			if ds_list_find_index(_stats, _weapon_stats[j]) == -1 {
				ds_list_add(_stats, _weapon_stats[j])
			}
		}
	}
	
	return list_to_array(_stats)
}

get_credit = function () {
	return noone	
}

function base_name() {
	return "Dummy"
}

function base_color() {
	return make_color_rgb(127, 127, 127)	
}

function clone (_clone_data) {
	return clone_base(o_combat_ball, _clone_data)
}

function clone_base(_ball_type, _clone_data) {
	var _creator = noone
	if (ds_map_exists(_clone_data, "creator")) {
		_creator =  ds_map_find_value(_clone_data, "creator")
	}
	
	var _size_ratio = 1
	if (ds_map_exists(_clone_data, "size_ratio")) {
		_size_ratio =  ds_map_find_value(_clone_data, "size_ratio")
	}
	var _color = (_creator != noone ? _creator.base_color() : self.base_color())
	
	var _team = (_creator != noone ? _creator.team : self.team)
	
	var _position = [x, y]
	if (ds_map_exists(_clone_data, "position")) {
		_position =  ds_map_find_value(_clone_data, "position")
	}
	
	var _velocity = [0, 1]
	if (ds_map_exists(_clone_data, "velocity")) {
		_velocity =  ds_map_find_value(_clone_data, "velocity")
	}
	
	var _health = hp
	if (ds_map_exists(_clone_data, "health")) {
		_health =  ds_map_find_value(_clone_data, "health")
	}
	
	var _clone_ball = instance_create_layer(_position[0], _position[1], "Balls", _ball_type)
	_clone_ball.name = (_creator != noone ? _creator.name + "Clone" : self.name + "Clone")
	_clone_ball.color = _color
	_clone_ball.radius *= _size_ratio
	_clone_ball.team = _team
		
	_clone_ball.xspd = _velocity[0]
	_clone_ball.yspd = _velocity[1]
	_clone_ball.hp = _health
	
	for (var i = 0; i < ds_list_size(weapons); i++) {
		weapons[|i].on_clone(_clone_ball)
	}
	
	return _clone_ball
}

