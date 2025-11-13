function Team(_name, _color) constructor
{
	name = _name
	color = _color
	
	static same_team = function (_other) {
		if _other == noone return false
		return name == _other.name && color == _other.color
	}
}


global.ALL_TEAMS = [
	noone,
	new Team("Red Team", make_colour_rgb(255, 66, 66)),
	new Team("Blue Team", make_colour_rgb(65, 121, 255)),
	new Team("Green Team", make_colour_rgb(73, 229, 59)),
	new Team("Yellow Team", make_colour_rgb(255, 223, 66)),
	new Team("Pink Team", make_colour_rgb(255, 66, 255)),
	new Team("Orange Team", make_colour_rgb(255, 170, 66)),
	new Team("Cyan Team", make_colour_rgb(66, 255, 255)),
	new Team("Gray Team", make_colour_rgb(188, 188, 188))
]
