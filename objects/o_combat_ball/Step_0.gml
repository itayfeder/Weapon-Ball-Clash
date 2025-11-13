// Inherit the parent event
event_inherited();

for (var i = 0; i < ds_list_size(weapons); i++) {
	weapons[|i].on_ball_step()
}

invincibility_frames = max(invincibility_frames - 1, 0)

if (hp <= 0 && !invulnerable) {
	kill()	
}