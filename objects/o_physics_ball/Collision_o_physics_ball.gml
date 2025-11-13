on_ball_hit_ball_base(other)
	
var dx = other.x - self.x
var dy = other.y - self.y
	
var distance = point_distance(self.x, self.y, other.x, other.y)
	
if (distance < self.radius + other.radius) {
	
	if distance == 0 {
		dx = 1
		dy = 0
		distance = 1
	} else {
		dx /= distance
		dy /= distance
	}
	
	var overlap = (self.radius + other.radius) - distance
	//if (self.movable) {
	//	self.x -= dx * overlap
	//	self.y -= dy * overlap
	//}
	
	//if (other.movable) {
	//	other.x += dx * overlap
	//	other.y += dy * overlap
	//}
		
	var dvx = other.xspd - self.xspd
	var dvy = other.yspd - self.yspd

	var dvn = dvx * dx + dvy * dy
	if dvn <= 0 {
		// Handle collision based on movability
		if (!self.movable && !other.movable) {
			// Both unmovable, do nothing
		} else if (!self.movable) {
			dvn = other.xspd * dx + other.yspd * dy

			other.xspd -= 2 * dvn * dx
			other.yspd -= 2 * dvn * dy
		} else if (!other.movable) {
			dvn = self.xspd * dx + self.yspd * dy

			self.xspd -= 2 * dvn * dx
			self.yspd -= 2 * dvn * dy
		} else {
			// Both movable - normal collision
			var self_mass = self.get_mass()
			var other_mass = other.get_mass()
			
			var impulse = 2 * dvn / (self_mass + other_mass)
			
			self.xspd += impulse * other_mass * dx
			self.yspd += impulse * other_mass * dy
			
			other.xspd -= impulse * self_mass * dx
			other.yspd -= impulse * self_mass * dy
		}
	}
}