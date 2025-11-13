// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("slices", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("slices", owner.slices)
}

on_weapon_hit_weapon = function (_other_weapon) {
	owner.slices += 1
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1)) {
		slice_debuff = instance_create_layer(x, y, "StatusEffects", o_slice_debuff)
		slice_debuff.slices = owner.slices - 1
		slice_debuff.applier = owner
		slice_debuff.color = owner.color
		_other_ball.add_status_effect(slice_debuff)
		
		
		if (_other_ball.id != owner.id) {
			owner.slices += 1
		}
	}
}

get_display_stats = function () {
	return ["Slices: " + string(owner.slices)]
}
