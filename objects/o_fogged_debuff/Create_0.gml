// Inherit the parent event
event_inherited();

team = noone

calculate_damage = function (_attacker, _damage) {
	if team != noone && team.same_team(_attacker.team) return _damage * 2
	if instance_exists(applier.owner) && (_attacker.id == applier.owner.id || _attacker.are_allies(applier.owner)) return _damage * 2
	return _damage	
}