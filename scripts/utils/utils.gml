function to_ticks (_number) {
	return _number * 60	
}

function vector_to_polar (_x, _y) {
	return [
		point_distance(0, 0, _x, _y),
		point_direction(0, 0, _x, _y)
	]
}

function vector_to_cartesian (_radius, _angle) {
	return [
		lengthdir_x(_radius, _angle),
		lengthdir_y(_radius, _angle)
	]
}

function unique_list(_original_list) {
	var _unique_list = ds_list_create();

	for (var i = 0; i < ds_list_size(_original_list); i++)
	{
	    var _current_value = ds_list_find_value(_original_list, i);
	    if (ds_list_find_index(_unique_list, _current_value) == -1)
	    {
	        ds_list_add(_unique_list, _current_value);
	    }
	}
	ds_list_copy(_original_list, _unique_list)
	ds_list_destroy(_unique_list)
}

function list_contains_id(_list, _id) {
	for (var i = 0; i < ds_list_size(_list); i++) {
		if instance_exists(_list[|i]) && _list[|i].id == _id {
			return i	
		}
	}
	return -1
}

function in_range(_x, _min, _max) {
	return _x >= _min and _x <= _max;
}

function list_to_array(_list) {
	var _list_size = ds_list_size(_list)
	
	var _new_array = array_create(_list_size)
	
	for (var i = 0; i < _list_size; i++) {
		_new_array[i] = _list[|i]	
	}
	
	ds_list_destroy(_list)
	
	return _new_array
}

function is_array_full(_array) {
	for (var i = 0; i < array_length(_array); i++) {
		if _array[i] == noone
			return false
	}
	return true
}

function get_text_adjusted_to_width(_base_scale, _text, _max_width) {
	var text = _text
	var base_scale = _base_scale
	while (text.get_bbox(room_width, room_height).width > _max_width) {
		base_scale -= 0.05
		text = text.scale(base_scale)
	}
	return text
}

function get_string_adjusted_to_width(_base_scale, _string, _font, _max_width) {
	var text = scribble(_string).starting_format(_font, c_white).align(fa_center, fa_middle).scale(_base_scale)
	var base_scale = _base_scale
	while (text.get_bbox(room_width, room_height).width > _max_width) {
		base_scale -= 0.05
		text = text.scale(base_scale)
	}
	return text
}

function draw_hollow_rectangle(x1, y1, x2, y2, back_color, border_color, border_width) {
	draw_rectangle_colour(
		x1, y1,
		x2, y2,
		border_color, border_color,
		border_color, border_color,
		false
	)
	
	draw_rectangle_colour(
		x1 + border_width, y1 + border_width,
		x2 - border_width, y2 - border_width,
		back_color, back_color,
		back_color, back_color,
		false
	)
}

