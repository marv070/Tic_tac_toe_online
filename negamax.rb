class Negamax

	attr_accessor :game_board, :players
	def initialize(game_board,players)
		@game_board = game_board
		@players = players
	end

	def computer_move()
		depth = 1
		player_marker = players.current_player
		negamax(game_board.board, player_marker, depth)
		return @best_move
	end
	
	private
	
	def negamax(board, mark, depth)
		mark == "O" ? opponent = "X" : opponent = "O"
		if game_board.winner?(mark) || game_board.board_full?()
			return game_result(mark, opponent)
		else 
			max = -1.0/0
			available_moves.each do |space|
				board[space] = mark
				score = -negamax(board, opponent, depth + 1)
				board[space] = "#{space + 1}"
				if score > max
					max = score
					if depth == 1
					@best_move = space
					end
				end
			end
			return max
		end
	end
	
	def available_moves()
		game_board.board.each_index.select { |s| game_board.board[s] != "X" && game_board.board[s] != "O"}
	end
	
	def game_result(mark, opponent)
		if game_board.winner?(mark)
			return 1
		elsif game_board.winner?(opponent)
			return -1
		else 
			return 0
		end
	end
end