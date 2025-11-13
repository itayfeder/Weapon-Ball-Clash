global.BASE_RADIUS = 55
global.BASE_ABILITY_COOLDOWN = to_ticks(1)

enum BALL_COLORS {
	SWORD = make_color_rgb(255, 100, 100),
	DAGGER = make_color_rgb(0, 255, 0),
	SPEAR = make_color_rgb(0, 255, 255),
	BOW = make_color_rgb(255, 255, 0),
	SCYTHE = make_color_rgb(171, 86, 255),
	SHIELD = make_color_rgb(187, 127, 0),
	SCEPTER = make_color_rgb(255, 164, 230),
	UNARMED = make_color_rgb(207, 207, 207),
	STAFF = make_color_rgb(65, 121, 255),
	SHURIKEN = make_color_rgb(140, 140, 0),
	WRENCH = make_color_rgb(252, 167, 8),
	HAMMER = make_color_rgb(194, 64, 123),
	KATANA = make_color_rgb(128, 255, 207),
	FLASK = make_color_rgb(0, 154, 0),
	LANCE = make_color_rgb(251, 229, 151),
	GRIMOIRE = make_color_rgb(143, 131, 149),
	
	LASER = make_color_rgb(219, 85, 52),
	SLAP_HAND = make_colour_rgb(80, 86, 150),
	CANDLE = make_colour_rgb(207, 203, 80),
	ANCHOR = make_colour_rgb(34, 37, 150),
	BRASS_KNUCKLES = make_colour_rgb(255, 138, 128)
}

global.CURRENT_MATCH = noone
global.CURRENT_GAME = noone
global.CURRENT_ROOM_MANAGER = noone

global.IN_MENU = false

global.PARTICLE_SYSTEM = noone
part_system_destroy(global.PARTICLE_SYSTEM)

