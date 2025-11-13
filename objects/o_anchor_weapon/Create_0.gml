// Inherit the parent event
event_inherited();

connected_anchors = ds_list_create()

on_initialize = function (_owner) {
	_owner.create_stat("weight", 0.3)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("weight", owner.weight)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1)) {
		anchored_debuff = instance_create_layer(x, y, "StatusEffects", o_anchored_debuff)
		anchored_debuff.weight = owner.weight
		anchored_debuff.applier = owner
		
		if (_other_ball.has_status_effect(anchored_debuff)) {
			var effect = _other_ball.get_status_effect(anchored_debuff)
			effect.weight = owner.weight
			effect.target = _other_ball
		} else {
			_other_ball.add_status_effect(anchored_debuff)
			ds_list_add(connected_anchors, anchored_debuff)
			_other_ball.yspd = 0
		}
		_other_ball.xspd = 0
		
		if (_other_ball.id != owner.id) {
			owner.weight += 0.1
		}
		
		
	}
}

get_display_stats = function () {
	var _best_damage = 1
	for (var i = 0; i < ds_list_size(connected_anchors); i++) {
		var _current_anchored = connected_anchors[|i]
		if instance_exists(_current_anchored) && instance_exists(_current_anchored.target) {
			var _damage = max(floor(_current_anchored.target.yspd / 6), 1)
			if (_damage > _best_damage) {
				_best_damage = _damage	
			}
		} else {
			ds_list_delete(connected_anchors, i)	
		}
	}
	return ["Weight: " + string(owner.weight),
		"Damage/Speed: " + string(_best_damage)
	]
}