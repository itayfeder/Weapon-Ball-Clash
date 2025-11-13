match_actors = ds_list_create()
prev_match_actors_size = ds_list_size(match_actors)

fighter_select_buttons = ds_list_create()

start_match_button = noone

ADD_BUTTON_SIZE = 16 * 15

add_button = instance_create_layer(room_width / 2, room_height / 2 - 100, "Buttons", o_add_button)
add_button.icon_size = ADD_BUTTON_SIZE
add_button.owner_manager = self

press_add_button = function (_add_button) {
	o_ball_select_manager.active = true
	o_ball_select_manager.open_fighter_select()
}

add_fighter = function (_fighter_object, _team=noone, _skin=0) {
	o_ball_select_manager.active = false
	o_ball_select_manager.close_fighter_select()
	
	var match_actor = new MatchActor(_fighter_object, _team, _skin)
	
	var _button = instance_create_layer(x, y, "Buttons", o_match_actor_button)
	_button.match_actor = match_actor
	_button.icon_size = 128
	_button.owner_manager = self
	
	ds_list_add(match_actors, _button)
	reorder_fighters()
	
	if (ds_list_size(match_actors) > 0 && start_match_button == noone) {
		start_match_button = instance_create_layer(x, y, "Buttons", o_start_match_button)
		start_match_button.owner_manager = self
	}
}

remove_fighter = function (_fighter_object) {
	if (prev_match_actors_size == ds_list_size(match_actors)) {
		var _index = list_contains_id(match_actors, _fighter_object.id)
		if (_index != -1) {
			ds_list_delete(match_actors, _index)
			instance_destroy(_fighter_object)
		}
		reorder_fighters()
	}
	
	if (ds_list_size(match_actors) == 0 &&  start_match_button != noone) {
		instance_destroy(start_match_button)
		start_match_button = noone
	}
}

reorder_fighters = function () {
	var _amount_of_balls = ds_list_size(match_actors)
	
	var _icon_size = 128
    var _pixel_size = _icon_size / 16
	
	var _space_between_options = _pixel_size * 1.5
    var _option_size = _icon_size + _pixel_size * 2.5
    var _row_length = _amount_of_balls * _option_size + (_amount_of_balls - 1) * _space_between_options
	
	var _menu_x_center = room_width / 2 - _row_length / 2
    var _menu_y_center = (room_height / 2 + 50)
	
	for (var i = 0; i < ds_list_size(match_actors); i++) {
		var _actor = match_actors[|i]	
		
		_actor.x = _menu_x_center + (_option_size + _space_between_options) * i + _pixel_size * 9
		_actor.y = _menu_y_center + _pixel_size * 9
	}
}

if (global.CURRENT_MATCH != noone) {
	for (var i = 0; i < ds_list_size(global.CURRENT_MATCH.balls); i++) {
		var _match_actor = global.CURRENT_MATCH.balls[|i]
		add_fighter(_match_actor.ball_type, _match_actor.team, _match_actor.skin)
	}
}
