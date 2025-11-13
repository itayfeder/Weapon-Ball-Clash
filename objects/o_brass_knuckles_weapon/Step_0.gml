// Inherit the parent event
event_inherited();

if rotation_speed != owner.brass_knuckles_anchor.rotation_speed {
	rotation_speed = owner.brass_knuckles_anchor.rotation_speed
}
if self.id != owner.brass_knuckles_anchor.id {
	angle = owner.brass_knuckles_anchor.angle - 75
}
