if (self.owner.id != other.owner.id && other.id != id && !owner.are_allies(other.owner)) {
	if (ds_list_find_index(collision_blacklist, other.id) == -1) {
		on_weapon_hit_weapon(other)
	
		var dx = x - other.x;
		var dy = y - other.y;
		var dist = point_distance(0, 0, dx, dy);
	
		var normal_x = dx / dist;
		var normal_y = dy / dist;
	
		var reflected_velocity = reflect(owner.xspd, owner.yspd, normal_x, normal_y);
	
		rotation_speed *= -1
		if owner.movable {
			owner.xspd = reflected_velocity[0]
			owner.yspd = reflected_velocity[1]
		}
	}

	
	ds_list_add(collision_blacklist, other.id)
}