
if place_meeting(x + xspd, y, o_border) {
	on_collide_wall(false)
}

if place_meeting(x, y + yspd, o_border) {
	on_collide_wall(true)
}

x += xspd
y += yspd
