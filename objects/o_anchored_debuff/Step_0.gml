// Inherit the parent event
event_inherited();

if target == noone {
	instance_destroy(self)
	exit
}

if target.invulnerable {
	target.remove_status_effect(self)
	instance_destroy()
	exit
}

target.yspd += 0.5 * weight
target.movable = false
