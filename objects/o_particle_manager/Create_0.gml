if (global.PARTICLE_SYSTEM == noone) {
	global.PARTICLE_SYSTEM = part_system_create()
	part_system_depth(global.PARTICLE_SYSTEM, layer_get_depth("Particles"))
	show_debug_message("beep boop")
}

destroy = function () {
	part_type_destroy(death_particle)
	
	part_system_destroy(global.PARTICLE_SYSTEM)
	global.PARTICLE_SYSTEM = noone
}

death_particle = part_type_create()
part_type_shape(death_particle, pt_shape_disk)
part_type_size(death_particle, 0.35, 0.35, 0, 0)
part_type_direction(death_particle, 0, 360, 0, 0)
part_type_speed(death_particle, 2, 4, 0, 0)
part_type_life(death_particle, 20, 40)
part_type_alpha2(death_particle, 1, 0)

slapped_particle = part_type_create()
part_type_shape(slapped_particle, pt_shape_line)
part_type_size(slapped_particle, 0.5, 0.5, 0, 0)
part_type_life(slapped_particle, 10, 20)
part_type_alpha2(slapped_particle, 1, 0)
part_type_orientation(slapped_particle, 0, 0, 0, 0, 1)

enum PARTICLES {
	DEATH,
	SLAPPED
}

get_particle = function (_particle_type) {
	switch (_particle_type) {
		case PARTICLES.DEATH:
			return death_particle
		case PARTICLES.SLAPPED:
			return slapped_particle
		default:
			return noone
	}
}