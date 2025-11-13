x_offset = 200
y_offset = 100

start_tournament_button = noone
fighter_select_buttons = ds_list_create()
add_buttons = ds_list_create()

contender_count = 8
contender_size = 0

contenders = array_create(1, noone)

setup_contenders = function (count) {
	contender_count = count
	contender_size = 96
	if count == 16 {
		contender_size = 64	
	} else if count == 32 {
		contender_size = 32	
	}

	contenders = array_create(contender_count, noone)

	var new_bracket = new Bracket(contenders) 
	if (global.CURRENT_GAME != noone && array_length(contenders) == array_length(global.CURRENT_GAME.contenders)) {
		contenders = global.CURRENT_GAME.contenders	
	} 
	new_bracket.contenders = contenders
	global.CURRENT_GAME = new_bracket
	
	update_contenders()
	
	global.CURRENT_GAME.current_match = 0
	global.CURRENT_GAME.current_round = 1

	current_index = 0
	
	create_add_buttons(self, contenders, x_offset, y_offset, contender_size)
}

update_contenders = function () {
	global.CURRENT_GAME.contenders = contenders
	global.CURRENT_GAME.initialize_bracket_contenders()
	
	if (is_array_full(contenders)) {
		if (start_tournament_button == noone) {
			start_tournament_button = instance_create_layer(x, y, "Buttons", o_start_tournament_button)
			start_tournament_button.owner_manager = self
		}
		
	} else {
		instance_destroy(start_tournament_button)
		start_tournament_button = noone
	}
}

press_add_button = function (_add_button) {
	current_index = _add_button.contender_index
	
	o_ball_select_manager.active = true
	o_ball_select_manager.open_fighter_select()
}

add_fighter = function (_fighter_object, _team=noone, _skin=0) {
	o_ball_select_manager.active = false
	o_ball_select_manager.close_fighter_select()
	
	var match_actor = new MatchActor(_fighter_object, _team, _skin)
	
	contenders[current_index] = match_actor
	update_contenders()
}

create_add_buttons = function (manager, contender_options, x_offset, y_offset, square_size) {
	for (var i = 0; i < ds_list_size(add_buttons); i++) {
		instance_destroy(add_buttons[|i])	
	}
	ds_list_clear(add_buttons)
	
	var between_opponents = (array_length(contender_options) / 2) - 1
    var spaces_between_opponents = (room_height - (y_offset * 2)) / between_opponents
	
	var current_x = x_offset
    var current_y = y_offset
    var otherside = false
	
	for (var i = 0; i < array_length(contender_options); i++) {
		if (i + 1) / array_length(contender_options) > 0.5 && !otherside {
			current_y = y_offset
            current_x = room_width - current_x
            otherside = true
		}
		
		add_button = instance_create_layer(
			current_x, current_y, "Buttons", o_add_button
		)
		add_button.icon_size = square_size
		add_button.owner_manager = self
		add_button.contender_index = i
		ds_list_add(add_buttons, add_button)
		
		current_y += spaces_between_opponents
	}
}

if (global.CURRENT_GAME != noone) {
	contender_count = array_length(global.CURRENT_GAME.contenders)
}

setup_contenders(contender_count)