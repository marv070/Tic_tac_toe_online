class Simple

attr_accessor  :game_board, :game_players, :fork_routes

  def initialize(game_board, game_players)
		@game_board = game_board
		@game_players = game_players
		@fork_routes = [[0,2,6],[0,2,8],[0,6,8],[2,6,8],[0,2,5],[0,2,3],[5,6,8],[3,6,8],[0,2,4],[2,4,8],[0,4,6],[6,4,8]]
	end
	
	def computer_move
		if computer_fork_move()
			else @medium_move = computer_random_move()
		end
		return @medium_move
	end
	
	def computer_fork_move
		player_marker = game_players.current_player()
		move = false
		fork_routes.each do |group|
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
	def computer_random_move()
		n = rand(0..8)
		if game_board.square_available?(n) == false
			computer_random_move()
		else
			return n
		end
	end
end