
ds_list_clear(colliding_balls)
var count = collision_circle_list(x, y, radius, o_combat_ball, false, true, colliding_balls, true)
for (var i = 0; i < count; i++) {
	var enemy_instance = colliding_balls[|i]
	if (!instance_exists(enemy_instance)) {
		continue	
	}
	
	if (enemy_instance.id != owner.id) {
		if (!ds_map_exists(dps_per_ball, enemy_instance.id)) {
				dps_per_ball[? enemy_instance.id] = 0
		}
		
		var damage_timer = ceil(to_ticks(1) / puddle_dps)
		if (((team != noone && team.same_team(enemy_instance.team)) || !owner.are_allies(enemy_instance)) && dps_per_ball[? enemy_instance.id] % damage_timer == 0) {
			owner.deal_damage(enemy_instance, 1)
		}
		
		if (dps_per_ball[? enemy_instance.id] == 0) {
			if (instance_exists(owner) && owner.object_index == o_flask_ball) {
				owner.puddle_dps += 0.2
			}
            dps_per_ball[? enemy_instance.id] = to_ticks(1)
		}
		
		dps_per_ball[? enemy_instance.id] = max(dps_per_ball[? enemy_instance.id] - 1, 0)
	}
}

if (closing && expanding_ticks == max_expansion_ticks) {
    instance_destroy()
}

if (life == 0) {
	closing = true
}

if (expanding_ticks == 0) {
	life = max(life - 1, 0)	
}

if (!closing) {
	expanding_ticks = max(expanding_ticks - 1, 0)
} else {
	expanding_ticks = min(expanding_ticks + 1, max_expansion_ticks)
}
