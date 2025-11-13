// Inherit the parent event
event_inherited();

on_projectile_hit_ball = function (_projectile, _other_ball) {
	if (!owner.are_allies(_other_ball) && owner.deal_damage(_other_ball, 1) && _other_ball.id != owner.id) {
		owner.add_to_stat("arrows", 1)
	}
}