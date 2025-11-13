// Inherit the parent event
event_inherited();

on_projectile_hit_ball = function (_projectile, _other_ball) {
	if (_other_ball.id != owner.id) {
		owner.deal_damage(_other_ball, 1)
	}
}