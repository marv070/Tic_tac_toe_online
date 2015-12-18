class Game

def board(title, s)

puts "\n" + title + 
"""
 #{s[0]} | #{s[1]} | #{s[2]} 
---|---|---
 #{s[3]} | #{s[4]} | #{s[5]} 
---|---|---
 #{s[6]} | #{s[7]} | #{s[8]}  
   
"""
end

def start_game
@sqrs = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
@empty = Array.new(9, " ")

board("Lets play Tic Tac Toe! :-)", @sqrs)
board("The current board is:", @empty)
set_players
end

def player1
puts "Player 1: choose X or O"
choice = gets.chomp.upcase
	if marker_valid?(choice) == true
	choice
	else player1
	end
end

def marker_valid?(test)
	test == "X" || test == "O"
end

def player2 (p1)
	if p1 == "X"
	"O"
	else "X"
	end
end

def set_players
@p1 = player1
@p2 = player2(@p1)
puts "\n" + "Player 1 is #{@p1} and Player 2 is #{@p2}."
@current = @p1
game_play
end

def square_chooser
	if @current == @p1
	@n = 1
	else @n = 2
	end
puts "\n" + "Player #{@n}, which square do you choose?"
square = gets.to_i
	if square_valid?(square, @empty) == true
	square
	else puts "\n" + "That square is not available"
	square_chooser
	end
end

def update_board(square)
@empty[square - 1] = @current
@sqrs[square - 1] = " "
puts "\n" + "Player #{@n} chooses square #{square}"
end

def square_valid?(position, board)
	position >= 1 && position <= 9 && board[position - 1] == " "
end

def player_changer
	if @current == @p1
	@current = @p2
	else @current = @p1
	end
end

def game_status
board("The current board is:", @empty)
board("Remaining Numbers:", @sqrs)
end

def game_play
	until board_full?(@empty) == true || win(@empty) == true
	space = square_chooser
	update_board(space)
	game_status
	player_changer
	end

	if board_full?(@empty) == true
	puts "\n" + "It's a tie.  Thank you for playing." + "\n\n"
	else puts "\n" + "Player #{@n} Wins!!!" + "\n\n"
	end
end

def board_full?(status)
  if status.include?(" ")
  false
  else true
  end
end

def win(board)
	if board[0] == "X" && board[1] == "X" && board[2] == "X" ||
	   board[3] == "X" && board[4] == "X" && board[5] == "X" ||
	   board[6] == "X" && board[7] == "X" && board[8] == "X" ||
	   board[0] == "X" && board[3] == "X" && board[6] == "X" ||
	   board[1] == "X" && board[4] == "X" && board[7] == "X" ||
	   board[2] == "X" && board[5] == "X" && board[8] == "X" ||
	   board[0] == "X" && board[4] == "X" && board[8] == "X" ||
	   board[2] == "X" && board[4] == "X" && board[6] == "X" ||
	   board[0] == "O" && board[1] == "O" && board[2] == "O" ||
	   board[3] == "O" && board[4] == "O" && board[5] == "O" ||
	   board[6] == "O" && board[7] == "O" && board[8] == "O" ||
	   board[0] == "O" && board[3] == "O" && board[6] == "O" ||
	   board[1] == "O" && board[4] == "O" && board[7] == "O" ||
	   board[2] == "O" && board[5] == "O" && board[8] == "O" ||
	   board[0] == "O" && board[4] == "O" && board[8] == "O" ||
	   board[2] == "O" && board[4] == "O" && board[6] == "O"
	true
	else false
	end
end
  
end
Game.new.start_game