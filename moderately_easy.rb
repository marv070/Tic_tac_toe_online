class ModEasy

attr_accessor  :game_board, :game_players

	def initialize(game_board, game_players)
		@game_board = game_board
		@game_players = game_players
	end
	
	def computer_move
		if computer_winning_move()
			elsif computer_blocking_move()
			else @medium_move = computer_random_move()
		end
		return @medium_move
	end
	
	def computer_winning_move
		player_marker = game_players.current_player()
		move = false
		game_board.winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if game_board.board[value] == player_marker
			end
			
			if count == 2
				group.each do |value|
					if game_board.board[value] != "X" && game_board.board[value] != "O"
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_blocking_move
		player_marker = game_players.current_player()
		opponent = game_players.opposite_player()
		move = false
		game_board.winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if game_board.board[value] == opponent
			end
			
			if count == 2
				group.each do |value|
					if game_board.board[value] != "X" && game_board.board[value] != "O"
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_random_move()
		n = rand(0..8)
		if game_board.square_available?(n) == false
			computer_random_move()
		else
			return n
		end
	end
end