if owner != noone {
	if !instance_exists(owner) {
		instance_destroy()
		exit
	}
	
	var radius_ratio = owner.owner.radius / global.BASE_RADIUS
	
	x_offset = lengthdir_x(owner.owner.radius * 0.5, owner.angle)
	y_offset = lengthdir_y(owner.owner.radius * 0.5, owner.angle)

	x = owner.x + x_offset
	y = owner.y + y_offset
	
	xspd = owner.owner.xspd
	yspd = owner.owner.yspd
	
	image_angle = owner.angle
	image_yscale = (owner.owner.beam_width * radius_ratio) / 2
}

x += xspd
y += yspd

var shortest_distance = beam_length;
hit_object = noone;

// Set sprite to max length first
image_xscale = beam_length / sprite_get_width(sprite_index);

// Check each object type
for (var i = 0; i < array_length(collidable_objects); i++) {
    var collision = instance_place(x, y, collidable_objects[i]);
    
    if (collision != noone && collision.id != owner.id) {
        var dist = point_distance(x, y, collision.x, collision.y);
        
        if (dist < shortest_distance) {
            shortest_distance = dist;
            hit_object = collision;
        }
    }
}

if (hit_object != noone && object_is_ancestor(hit_object.object_index, o_combat_ball)) {
    if (!owner.owner.are_allies(hit_object) && owner.owner.deal_damage(hit_object, 1) && hit_object.id != owner.owner.id) {
		owner.owner.beam_width += 1
		owner.owner.beam_cooldown = max(owner.owner.beam_cooldown - 0.5, 1)
	}
}

image_xscale = shortest_distance / sprite_get_width(sprite_index);
