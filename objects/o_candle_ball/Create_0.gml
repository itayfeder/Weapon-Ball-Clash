// Inherit the parent event
event_inherited();

function base_name() {
	return "Candle"
}

function base_color() {
	return BALL_COLORS.CANDLE
}

function clone (_clone_data) {
	var _clone = clone_base(o_candle_ball, _clone_data)
	_clone.fog_size = fog_size
	return _clone
}

color = base_color()
name = base_name()

get_credit = function () {
	return "Xebrax"	
}


add_weapon(o_candle_weapon, 4)
