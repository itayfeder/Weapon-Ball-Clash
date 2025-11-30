function get_ball_icon(ball_object) {
	if ball_object == o_amalgam_ball {
		return spr_amalgam_icon
	}
	var _weapon_id = array_get_index(global.ALL_BASIC_BALLS, ball_object)
	if (_weapon_id != -1) {
		return global.ALL_BALL_ICONS[_weapon_id]
	} else {
		return spr_unknown_icon
	}
}

function draw_ball_icon(_index, _skin_index, _icon_size, _x, _y, _back_color=global.CURRENT_THEME.inner_arena) {
	draw_sprite_ext(spr_icon_background_default, 0, _x, _y, _icon_size / 16, _icon_size / 16, 0, _back_color, 1)
	draw_sprite_ext(get_ball_icon(_index), _skin_index, _x, _y, _icon_size / 16, _icon_size / 16, 0, c_white, 1)
}

function draw_winner_title(_ball) {
	var name = _ball.team != noone ? _ball.team.name : _ball.base_name()
	var title = scribble("[scale,1.5]" + name + " Wins!")
		.starting_format("f_impact", _ball.get_ball_color())
		.align(fa_center, fa_middle)
		
	outline_text_if_ball_allowed(title, c_black, 5,_ball.object_index)
	
	title = title.wrap(700)
		
	title.draw(room_width / 2, room_height / 2)
}

function draw_type_winner_title(_ball) {
	var _ball_obj = instance_create_layer(-200, -200, layer, _ball)
	var title = scribble("[scale,1.5]" + _ball_obj.base_name() + " Wins!")
		.starting_format("f_impact", _ball_obj.get_ball_color())
		.align(fa_center, fa_middle)
		.sdf_outline(c_black, 5)
		.wrap(700)
		
	title.draw(room_width / 2, room_height / 2)
	_ball_obj.kill()
}

function outline_text_if_ball_allowed(string_object, color, thickness, _ball) {
	if !array_contains(global.BALLS_WITHOUT_OUTLINES, _ball) {
		string_object = string_object.sdf_outline(color, thickness)
	}
}
