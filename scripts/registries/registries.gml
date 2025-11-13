global.BASE_BALLS = [
	o_sword_ball, o_dagger_ball, o_spear_ball, o_bow_ball,
	o_scythe_ball, o_shield_ball, o_scepter_ball, o_unarmed_ball,
	o_staff_ball, o_shuriken_ball, o_wrench_ball, o_hammer_ball,
	o_katana_ball, o_flask_ball, o_lance_ball, o_grimoire_ball,
]

global.FANMADE_BALLS = [
	o_laser_ball, o_slap_hand_ball, o_candle_ball, o_anchor_ball,
	o_brass_knuckles_ball
]

global.ALL_BASIC_BALLS = array_concat(global.BASE_BALLS, global.FANMADE_BALLS)

global.ALL_BALLS = array_concat(ALL_BASIC_BALLS, [
	//o_amalgam_ball
])

global.ALL_BALL_ICONS = [
	spr_sword_icon, spr_dagger_icon, spr_spear_icon, spr_bow_icon,
	spr_scythe_icon, spr_shield_icon, spr_scepter_icon, spr_unarmed_icon,
	spr_staff_icon, spr_shuriken_icon, spr_wrench_icon, spr_hammer_icon,
	spr_katana_icon, spr_flask_icon, spr_lance_icon, spr_grimoire_icon,
	
	spr_laser_icon, spr_slap_hand_icon, spr_candle_icon, spr_anchor_icon,
	spr_brass_knuckles_icon,
	
	spr_unknown_icon
]