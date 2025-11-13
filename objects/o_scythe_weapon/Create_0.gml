// Inherit the parent event
event_inherited();

on_initialize = function (_owner) {
	_owner.create_stat("poison_damage", 1)
}

on_clone = function (_clone_ball) {
	_clone_ball.set_stat("poison_damage", owner.poison_damage)
}

on_weapon_hit_ball = function (_other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1)) {
		poison_debuff = instance_create_layer(x, y, "StatusEffects", o_poison_debuff)
		poison_debuff.poison_damage = owner.poison_damage
		poison_debuff.applier = owner
		if (_other_ball.has_status_effect(poison_debuff)) {
			var effect = _other_ball.get_status_effect(poison_debuff)
			effect.poison_damage = owner.poison_damage
			effect.target = _other_ball
		} else {
			_other_ball.add_status_effect(poison_debuff)
		}
		
		if (_other_ball.id != owner.id) {
			owner.poison_damage += 1	
		}
	}
}

get_display_stats = function () {
	return ["Poison Damage: " + string(owner.poison_damage)]
}
