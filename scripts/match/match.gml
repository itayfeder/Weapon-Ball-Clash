function MatchActor(_ball_type, _team=noone, _skin=0) constructor
{
	ball_type = _ball_type
	team = _team
	skin = _skin
	
	static new_ball = function () {
		var _ball_object = instance_create_layer(0, 0, "Balls", ball_type, {
			skin: skin
		})
		_ball_object.team = team
		return _ball_object
	}
}

function Match() constructor
{
	balls = ds_list_create()
	ball_objects = ds_list_create()
	
	static add_ball = function (_new_ball, _team=noone, _skin=0) {
		ds_list_add(balls, new MatchActor(_new_ball, _team, _skin))
	}
	
	static add_ball_actor = function (_new_actor) {
		ds_list_add(balls, _new_actor)	
	}
	
	static begin_match = function () {
		for (var i = 0; i < ds_list_size(balls); i++) {
			var _ball_object = balls[|i].new_ball()
			randomize()
			_ball_object.x = irandom_range(room_width / 2 - 200, room_width / 2 + 200)
			_ball_object.y = irandom_range(room_height / 2 - 200, room_height / 2 + 200)
			
			ds_list_add(ball_objects, _ball_object)
		}
	}
	
	static living_balls = function () {
		var _living = ds_list_create()
		for (var i = 0; i < ds_list_size(ball_objects); i++) {
			if instance_exists(ball_objects[|i]) {
				ds_list_add(_living, ball_objects[|i])	
			}
		}
		return list_to_array(_living)
	}
	
	static has_winner = function () {
		var _living = living_balls()
		if array_length(_living) == 1 {
			return true	
		}
		var _unique_teams = ds_list_create()
		for (var i = 0; i < array_length(_living); i++) {
			if ds_list_find_index(_unique_teams, _living[i].team) == -1 {
				ds_list_add(_unique_teams, _living[i].team)	
			}
		}
		
		var _team_count = ds_list_size(_unique_teams)
		
		if _team_count == 1 && ds_list_find_index(_unique_teams, noone) != 0 return true
		ds_list_destroy(_unique_teams)
		
		return false
	}
	
	static destroy = function () {
		for (var i = 0; i < ds_list_size(ball_objects); i++) {
			instance_destroy(ball_objects[|i])	
		}
	}
	
	static cleanup = function () {
		destroy()
        ds_list_destroy(balls)
		ds_list_destroy(ball_objects)
    }
}

function BracketMatch(owner_bracket) : Match() constructor {
	bracket = owner_bracket
}

function Bracket(_contenders) constructor {
	contenders = _contenders
	contender_count = array_length(contenders)
	
	rounds = log2(contender_count) + 1
	matches_this_round = floor(contender_count / 2)
	matches_per_round = array_create(rounds)
	
	current_round = 1
	current_match = 1
	
	winning_round = rounds - 1
	
	static initialize_bracket_contenders = function () {
		matches_per_round = array_create(rounds)
		
		var matches = array_length(contenders)
		for (var iround = 0; iround < rounds; iround++) {
			matches /= 2
			
			if matches < 1 {
				var matches_array = array_create(1)
				matches_array[0] = noone
				matches_per_round[iround] = matches_array
				continue
			}
			
			var matches_array = array_create(matches)
			for (var imatch = 0; imatch < matches; imatch++) {
				if iround == 0 {
					matches_array[imatch] = [contenders[2 * imatch], contenders[2 * imatch + 1]]
				} else {
					matches_array[imatch] = [noone, noone]
				}
			}
			matches_per_round[iround] = matches_array
		}
	}
	
	static get_current_match = function () {
		var new_match = new BracketMatch(self)
		new_match.add_ball_actor(matches_per_round[current_round - 1][(current_match - 1) % matches_this_round][0])
		new_match.add_ball_actor(matches_per_round[current_round - 1][(current_match - 1) % matches_this_round][1])
		return new_match
	}
	
	static get_match_data = function (match_id) {
		var match_num = match_id -1
		var match_index = match_num
		var current_round = 0
		var _matches_this_round = floor(contender_count / 2)
		
		while match_index >= _matches_this_round {
			match_index -= _matches_this_round
			_matches_this_round = floor(_matches_this_round / 2)
			current_round += 1
		}
		
		if round == winning_round {
			return get_winner()	
		}
		
		return [
			matches_per_round[current_round][match_index],
			matches_per_round[current_round + 1][floor(match_index / 2)][match_index % 2]
		]
	}
	
	static set_match_winner = function (option) {
		var winner = matches_per_round[current_round - 1][(current_match - 1) % matches_this_round][option - 1]
		if current_round == winning_round {
			matches_per_round[winning_round] = [winner]
		} else {
			matches_per_round[current_round][floor(((current_match - 1) % matches_this_round) / 2)][(current_match - 1) % 2] = winner
		}
	}
	
	static next_match = function () {
		if current_match == matches_this_round {
			current_round += 1
			current_match = 0
			matches_this_round = floor(matches_this_round / 2)
		}
		current_match += 1
	}
	
	static has_winner = function () {
		return array_length(matches_per_round[winning_round]) == 1 && matches_per_round[winning_round][0] != noone
	}
	
	static get_winner = function () {
		return matches_per_round[winning_round][0]
	}
	
	static get_matches = function (roundi) {
		return matches_per_round[roundi - 1]
	}
	
	static draw_bracket = function (mananger, width_margin, height_margin, square_size) {
		var starting_x = width_margin
        var starting_y = height_margin
		
		var current_x = starting_x
        var current_y = starting_y
		
		var between_opponents = power(2, (array_length(self.matches_per_round) - 2)) - 1
        var spaces_between_opponents = (room_height - (starting_y * 2)) / between_opponents
	
		var between_rounds = array_length(matches_per_round) * 2
        var spaces_between_rounds = (room_width - (starting_x * 2)) / between_rounds
	
		var current_match = 1
		
		for (var roundi = 0; roundi < rounds - 2; roundi++) {
			current_y = starting_y + (spaces_between_opponents * (power(2, roundi) - 1) / 2)
            current_x = starting_x + spaces_between_rounds * roundi
			var otherside = false
			
			for (var i = 0; i < array_length(matches_per_round[roundi]); i++) {
				var _match = matches_per_round[roundi][i]
				var should_move_up = false
				
				if self.current_match == current_match && roundi + 1 == self.current_round
					should_move_up = true
				
				if (i + 1) / array_length(matches_per_round[roundi]) > 0.5 && !otherside {
					current_y = starting_y + (spaces_between_opponents * (power(2, roundi) - 1) / 2)
                    current_x = room_width - current_x
                    spaces_between_rounds *= -1
                    otherside = true
				}
				
				var otherside_shift =  otherside ? -square_size / 16 : square_size / 16
				
				draw_line_width_colour(
						current_x, current_y - 1, current_x + spaces_between_rounds + otherside_shift, current_y - 1,
						square_size / 8, global.CURRENT_THEME.text, global.CURRENT_THEME.text
				)
				
				draw_line_width_colour(
						current_x + spaces_between_rounds, current_y, 
						current_x + spaces_between_rounds, current_y + (spaces_between_opponents * (power(2, roundi + 1) - power(2, roundi)) / 2),
						square_size / 8, global.CURRENT_THEME.text, global.CURRENT_THEME.text
				)
				
				if _match[0] != noone {
					draw_ball_icon(_match[0].ball_type, _match[0].skin, square_size, 
						current_x + spaces_between_rounds * should_move_up,
						current_y
					)
				}
				current_y += spaces_between_opponents * power(2, roundi)
				
				draw_line_width_colour(
						current_x, current_y - 1, current_x + spaces_between_rounds + otherside_shift, current_y - 1,
						square_size / 8, global.CURRENT_THEME.text, global.CURRENT_THEME.text
				)
				
				draw_line_width_colour(
						current_x + spaces_between_rounds, current_y, 
						current_x + spaces_between_rounds, current_y - (spaces_between_opponents * (power(2, roundi + 1) - power(2, roundi)) / 2),
						square_size / 8, global.CURRENT_THEME.text, global.CURRENT_THEME.text
				)

				if _match[1] != noone {
					draw_ball_icon(_match[1].ball_type, _match[1].skin, square_size, 
						current_x + spaces_between_rounds * should_move_up,
						current_y
					)
				}
				
				current_y += spaces_between_opponents * (power(2, roundi))
                current_match += 1
			}
			
			spaces_between_rounds *= -1
            current_match -= array_length(self.matches_per_round[roundi])
		}
		
        current_y = starting_y + (spaces_between_opponents * (power(2, roundi) - 1) / 2)
        current_x = starting_x + spaces_between_rounds * roundi
		
		var should_move_up = false
		if self.current_match == current_match and roundi + 1 == self.current_round
            should_move_up = true
		
		draw_line_width_colour(
				current_x, current_y, room_width / 2 - spaces_between_rounds, current_y,
				square_size / 8, global.CURRENT_THEME.text, global.CURRENT_THEME.text
		)

		if matches_per_round[roundi][0][0] != noone {
			draw_ball_icon(matches_per_round[roundi][0][0].ball_type, matches_per_round[roundi][0][0].skin,
				square_size, 
				current_x + spaces_between_rounds * should_move_up,
				current_y
			)
		}
		current_x = room_width - current_x
		
		draw_line_width_colour(
				current_x, current_y, room_width / 2 + spaces_between_rounds, current_y,
				square_size / 8, global.CURRENT_THEME.text, global.CURRENT_THEME.text
		)

		if matches_per_round[roundi][0][1] != noone {
			draw_ball_icon(matches_per_round[roundi][0][1].ball_type, matches_per_round[roundi][0][1].skin,
				square_size, 
				current_x - spaces_between_rounds * should_move_up,
				current_y
			)
		}
		
		current_y = room_height / 2
        current_x = room_width / 2
		if has_winner() {
			draw_ball_icon(get_winner().ball_type, get_winner().skin, square_size * 2, 
				current_x,
				current_y
			)
		}
	}
	
	initialize_bracket_contenders()
}
