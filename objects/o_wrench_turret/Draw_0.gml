// Inherit the parent event

draw_rotated_rect(x, y, angle, 42.5, 15, c_black, 1);
if (owner != noone) {
	draw_rotated_rect(x, y, angle, 42.5 * 0.975, 15 * 0.75, owner.get_ball_color(), 1);
	circle_color = owner.get_ball_color()
} else {
	draw_rotated_rect(x, y, angle, 42.5 * 0.975, 15 * 0.75, color, 1);	
}


event_inherited();

