if (instance_exists(target)) {
	applier.deal_damage(target, poison_damage, applier.get_ball_color())
	alarm[0] = to_ticks(5)
}