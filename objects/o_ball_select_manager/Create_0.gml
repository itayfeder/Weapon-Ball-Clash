active = false

fighter_select_buttons = ds_list_create()

current_viewed_fighter = noone
viewed_figher_title = noone

open_fighter_select = function () {
	global.IN_MENU = true
	
	var amount_of_balls = array_length(global.ALL_BALLS)
	
	var space_between_options = 14
    var option_size = 72
	var pixel_size = 72 / 18
	
    var options_in_row = balls_in_row
	
	var amount_of_rows = ceil(amount_of_balls / options_in_row)
	
	var row_length = options_in_row * option_size + (options_in_row - 1) * space_between_options
    var column_length = amount_of_rows * option_size + (amount_of_rows - 1) * space_between_options
	
	var menu_x_center = room_width / balls_in_row - row_length / 2
    var menu_y_center = room_height / 2 - column_length / 2
	
	for (var i = 0; i < amount_of_balls; i++) {
		var ball = global.ALL_BALLS[i]
		var x_index = i % options_in_row
        var y_index = floor(i / options_in_row)
		
		var _button = instance_create_layer(
			menu_x_center + option_size / 2 + (space_between_options + option_size) * x_index, 
			menu_y_center + option_size / 2 + (space_between_options + option_size) * y_index, 
			"OverButtons", o_fighter_select_button, {
				associated_weapon: ball,
				owner_manager: global.CURRENT_ROOM_MANAGER
			}
		)
		_button.associated_weapon = ball
		_button.owner_manager = global.CURRENT_ROOM_MANAGER

		ds_list_add(fighter_select_buttons, _button)
	}
}

close_fighter_select = function () {
	clear_display()
	global.IN_MENU = false
	
	for (var i = 0; i < ds_list_size(fighter_select_buttons); i++) {
		instance_destroy(fighter_select_buttons[|i])	
	}
	ds_list_clear(fighter_select_buttons)
}

display_fighter = function (_ball_id) {
	if (current_viewed_fighter == noone) || current_viewed_fighter.object_index != _ball_id {
		clear_display()
			
		current_viewed_fighter = instance_create_layer(
			room_width / balls_in_row * (balls_in_row - 1), room_height / 2 - column_length / 10, "OverButtons", _ball_id, {
			disabled: true,
			effected_by_gravity: false,
			movable: false,
			radius: global.BASE_RADIUS * 1.25
		})
		
		viewed_figher_title = scribble(current_viewed_fighter.name + " [scale, 4][c_white][" + sprite_get_name(get_ball_icon(_ball_id)) + ",0][/c][/scale]")
			.starting_format("f_impact", current_viewed_fighter.get_ball_color())
			.scale(1)
			.align(fa_center, fa_middle)
		
		outline_text_if_ball_allowed(viewed_figher_title, c_black, 3, _ball_id)
		
		viewed_figher_title = get_text_adjusted_to_width(1, viewed_figher_title, row_length * 0.9)
	}

}

clear_display = function () {
	if current_viewed_fighter != noone {
		current_viewed_fighter.kill()
	}
	
	current_viewed_fighter = noone
	viewed_figher_title = noone
}

amount_of_balls = array_length(global.ALL_BALLS)
balls_in_row = 4
amount_of_rows = ceil(amount_of_balls / balls_in_row) + 1
	
row_length = (balls_in_row + 1) * 72 + ((balls_in_row + 1) - 1) * 14
column_length = amount_of_rows * 72 + (amount_of_rows - 1) * 14
