require_relative "gameplayers.rb"
require_relative "gameboard.rb"
require_relative "random.rb"
require_relative "medium.rb"
require_relative "simple.rb"
require_relative "moderately_easy.rb"
require_relative "negamax.rb"
require "minitest/autorun"



def board(board, test_board)
  ['1','2','3','4','5','6','7','8','9']
  end
end


class Tictactoe_tests < Minitest::Test


	def test_start_game_board
		board = Gameboard.new
		assert_equal(['1','2','3','4','5','6','7','8','9'], board.board)
		end


	def test_for_valid_marker
		player = Gameplayers.new
		assert_equal("X",player.p2)
		end
			
	def test_valid_move
		game = Gameboard.new 
		game.board[0] = "X"
		assert_equal(true,game.square_available?(1))
		assert_equal(false,game.square_available?(0))
		end
	

	def test_random_move
		 board = Gameboard.new
		 board(board, ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' '])
		 ai = Easy.new('comp', 'X')
		 position = ai.computer_move(board)
		 assert_equal(4, position)
		 assert_equal(true, [1,2,3,4,5,6,7,8,9].include?(position))
		 assert_equal(false,[11].include?(position))
	
	end
	
	def test_update_board
		game = Gameboard.new 
		game.board[0] = "X"
		assert_equal(["X", "2", "3", "4", "5", "6", "7", "8", "9"], game.board )
		
	end
	
		# def test_game_winning
		# game = Gameboard.new
		# ai = AI.new
		# assert_equal(["X", "X", "O", "O", "5", "0", "X", "O", "9"], ai.available_moves(4))
		

	# end
		
end
		


	# def test_initialize
		# game = TTTgame.new(@board,"","",1,"") 
		# assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9"], game.board)
		# assert_equal("",game.p1)
		# assert_equal("",game.p2)
		# assert_equal("",game.currentplayer)

		# end
		
	# def test_update_marker
		# game = Gameplayers.new
		
		# assert_equal("X",game.p2)
	# end
