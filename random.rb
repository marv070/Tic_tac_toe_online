class Easy                    

	attr_accessor :game_board

	def initialize(game_board)  
		@game_board = game_board
	end
	
	def computer_move()
		n = rand(0..8)
		if game_board.square_available?(n) == false
			computer_move()
		else
			return n
		end
	end
end