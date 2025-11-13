ds_list_clear(owner.echoes)
jousting = true
owner.effected_by_gravity = false
owner.movable = false
owner.invulnerable = true
rotation_speed = 0

var movement_vector = vector_to_cartesian(0.8, angle)
owner.xspd = movement_vector[0]
owner.yspd = movement_vector[1]

alarm[1] = global.BASE_ABILITY_COOLDOWN * 1.2