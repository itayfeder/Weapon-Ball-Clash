current_arorws -= 1
summon_arrow(self)

if (current_arorws == 0) {
	alarm[0] = global.BASE_ABILITY_COOLDOWN
} else {
	alarm[1] = 2
}