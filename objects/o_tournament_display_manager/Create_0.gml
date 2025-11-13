contender_count = 8
contender_size = 96

x_offset = 200
y_offset = 100

winner_state = false
next_match_button = noone

if (!global.CURRENT_GAME.has_winner() && next_match_button == noone) {
	next_match_button = instance_create_layer(x, y, "Buttons", o_next_tournament_match_button)
	next_match_button.owner_manager = self
}