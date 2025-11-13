// Inherit the parent event
event_inherited();

weight = 0.3

on_collide_wall = function (_vertical) {
	if _vertical && target.yspd > 0 {
		show_debug_message(target.yspd)
		applier.deal_damage(target, max(floor(target.yspd / 6), 1))
			
		target.yspd += sign(target.yspd) * irandom_range(0, 5)
		target.xspd = irandom_range(-3, 3)
		target.movable = true
		
		target.remove_status_effect(self)
		instance_destroy()
		exit
	}
}