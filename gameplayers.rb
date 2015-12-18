class Gameplayers
		attr_accessor :player1, :player2, :current, :type
		
		def initialize
			@player1 = ""
			@player2 = ""
			@current = 1
			@type = ""
		end
		
		def p2
			if	player1 == "X"
			 "O" 
			else
			 "X"
		end
		end
		
		def current_player
		if	current == 1 
			player1 
		else
			player2
		end
		end
		
		def opposite_player
		if	current == 1 
			player2 
		else	
			player1
		end
		end
		
		def change
		if current == 1 
		   current = 2 
		else current = 1
		end
		end
	end