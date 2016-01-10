require_relative "negamax.rb"
require_relative "medium.rb"
require_relative "gameboard.rb"
require_relative "gameplayers.rb"
require_relative "random.rb"

require "minitest/autorun"

class MyTests < Minitest::Test

#random(easy) test
  def test_random_function_returns_random_available_choice
    game_board = Gameboard.new()  
    game_players = Gameplayers.new()
	game_board.board = ["1","2","X","4","5","6","7","8","9"]
	game_players.current = 2
	ai = Easy.new(game_board)
    assert(true,[0..8])

  end

def test_random_function_returns_random_available_choice_2
    game_board = Gameboard.new()  
    game_players = Gameplayers.new()
	game_board.board = ["O","X","X","O","X","O","X","O","X"]
	game_players.current = 2
	ai = Easy.new(game_board)
    assert(true,[0..8])

  end



# Negamax tests
	def test_corner_move
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["X","2","3","4","5","6","7","8","9"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(4, square)
	end
	
	def test_2corner_move
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["X","2","3","4","O","6","X","8","9"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(3, square)
	end
	
	def test_2corner_move_opposite
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["X","2","3","4","O","6","7","8","X"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(1, square)
	end
	
	def test_only_one_choice
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["O","X","O","X","5","X","O","O","X"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(4, square)
	end
	
	def test_go_for_the_win
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["O","2","X","O","X","O","7","8","O"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(6, square)
	end
	
	def test_go_for_the_win_again
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["1","X","3","X","O","X","7","8","O"]
		game_players.current = 1
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(0, square)
	end
	
	def test_go_for_the_block
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["O","X","O","4","X","6","7","8","9"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(7, square)
	end
	
	def test_go_for_the_block_again
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["X","O","3","O","X","X","7","8","9"]
		game_players.current = 1
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(8, square)
	end
	
	def test_go_for_the_win_instead_of_block
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["O","2","X","O","5","X","7","8","9"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(6, square)
	end
	
	def test_create_fork
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["X","2","3","4","5","6","O","X","O"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(2, square)
	end
	
	def test_block_fork
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["1","2","X","4","O","6","X","8","9"]
		game_players.current = 2
		ai = Negamax.new(game_board, game_players)
		square = ai.computer_move()
		assert(1, square)
	end
# Medium tests	
	def test_X_should_win
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["X","X","3","4","5","6","7","8","9"]
		game_players.player1 = "X"
		ai = Medium.new(game_board, game_players)
		ai.computer_move()
		assert(2, @medium_move)
	end
	
	def test_X_should_block
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["O","O","3","4","5","6","7","8","9"]
		game_players.player1 = "X"
		ai = Medium.new(game_board, game_players)
		ai.computer_move()
		assert(2, @medium_move)
	end
	
	def test_X_should_fork
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["1","2","3","X","5","6","7","8","X"]
		game_players.player1 = "X"
		ai = Medium.new(game_board, game_players)
		ai.computer_move()
		assert(6, @medium_move)
	end
	
	def test_X_should_fork_block
		game_board = Gameboard.new()
		game_players = Gameplayers.new()
		game_board.board = ["1","2","3","O","5","6","7","8","O"]
		game_players.player1 = "X"
		ai = Medium.new(game_board, game_players)
		ai.computer_move()
		assert(6, @medium_move)
	end
end
