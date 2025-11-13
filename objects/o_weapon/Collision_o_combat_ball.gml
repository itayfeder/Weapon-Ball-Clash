if (other.id != owner.id && ds_list_find_index(collision_blacklist, other.id) == -1) {
	on_weapon_hit_ball(other)
	
	ds_list_add(collision_blacklist, other.id)
}