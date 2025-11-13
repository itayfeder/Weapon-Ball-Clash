// Inherit the parent event
event_inherited();

var polar_speed = vector_to_polar(target.xspd, target.yspd)
if polar_speed[0] <= original_speed - max_extra_movement {
	if instance_exists(target) {
		target.remove_status_effect(self)
	}
	instance_destroy()
	exit
}

extra_movement -= 0.04
polar_speed[0] -= 0.04
var cartesian_speed = vector_to_cartesian(polar_speed[0], polar_speed[1])

target.xspd = cartesian_speed[0]
target.yspd = cartesian_speed[1]

var _slapped_particle = o_particle_manager.get_particle(PARTICLES.SLAPPED)
part_type_colour1(_slapped_particle, applier.get_ball_color())
part_type_speed(_slapped_particle, polar_speed[0] * 0.4, polar_speed[0] * 0.6, 0, 0)
part_type_direction(_slapped_particle, 180 + polar_speed[1], 180 + polar_speed[1], 0, 0)
	
part_particles_create(global.PARTICLE_SYSTEM, 
	target.x + irandom_range(-target.radius, target.radius), target.y + irandom_range(-target.radius, target.radius), 
	_slapped_particle, 1
)

if extra_movement == 0 {
	target.remove_status_effect(self)
	instance_destroy()
	exit
}
