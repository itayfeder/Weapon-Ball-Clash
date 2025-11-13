
radius = base_radius + 20 - expanding_ticks

if !instance_exists(owner) {
	instance_destroy()
	exit
}

if (expanding_ticks > 0) {
	ds_list_clear(colliding_balls)
	var count = collision_circle_list(x, y, radius, o_combat_ball, false, true, colliding_balls, true)
	for (var i = 0; i < count; i++) {
		var enemy_instance = colliding_balls[|i]
		if (enemy_instance.id != owner.id && ds_list_find_index(collision_blacklist, enemy_instance.id) == -1) {
			if (!owner.are_allies(enemy_instance) && owner.deal_damage(enemy_instance, blast_damage)) {
				if (owner.object_index == o_staff_ball) {
					owner.blast_damage += 1
					owner.blast_radius += 10
				}
				ds_list_add(collision_blacklist, enemy_instance.id)
			}
		}
	}
}

if fading_ticks == 0 {
	instance_destroy()	
}
if expanding_ticks == 0 {
	fading_ticks = max(fading_ticks - 1, 0)	
}
expanding_ticks = max(expanding_ticks - 1, 0)