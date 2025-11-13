if (ds_list_find_index(collision_blacklist, other.id) == -1) {
	if (owner != noone && instance_exists(owner) && !owner.are_allies(other) && other.id != owner.id) {
		on_projectile_hit_ball(self, other)
		
		ds_list_add(collision_blacklist, other.id)
		instance_destroy()
	}
}