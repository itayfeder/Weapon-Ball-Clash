// Inherit the parent event
event_inherited();

max_extra_movement = 0
extra_movement = max_extra_movement
original_speed = 0

on_collide_wall = function (_vertical) {
	applier.deal_damage(target, 1)
}