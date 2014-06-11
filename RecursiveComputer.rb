class RecursiveComputer
	#1,9,8,3,6
	def initialize

	end

  # rename Turn -> turn
  # prefer to take a tic_tac_toe than a board
  # because the tic_tac_toe can provide abstractions around the things we calculate
  def Turn(board)
  	current_turn = false
  	empty = num_available_moves(board)
  	if empty > 7
  		print "Thinking... Please Wait!"
  	end
  	move =  (tree board, current_turn).to_i + 1
  	return move
  end

  private

  def num_available_moves(board)
  	board.size - board.compact.size
  end



  def tree(board,turn,empty = 0,best = {})
  	move_char = (turn ? 'X' : 'O')
		if (computer_victory(board) || player_victory(board))
			return -10
		end
		if num_available_moves(board) == 0
			return 0
		end



		

		for i in (0...board.length) do
			if (board[i] != nil)
        # no op
    else			
				new_board = Array.new(board.length,nil)
				for j in (0...board.length)
					new_board[j] = board[j]
				end
				new_board[i] = move_char
				best[(i).to_s] = (-1 * (tree new_board, !turn, empty + 1,{}))
			end
		end

		move = best.max_by { |key,value| value }[0]
		high_score = best.max_by { |key, value| value }[1]

		if  empty == 0
			return move
		else
			return high_score 
		end
	end

	def player_victory(board)
		for possible in possible_wins(board)
			if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'X' )
				return true
			end
		end
		return false
	end

	def computer_victory(board)
		for possible in possible_wins(board)
			if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'O' )
				return true
			end
		end
		return false
	end



	def possible_wins(board)
		possible_wins = Array.new
		if board.length == 9
			possible_wins = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		elsif board.length == 16
			possible_wins = [[0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15], [0,4,8,12], [1,5,9,13], [2, 6, 10, 14], [3, 7, 11, 15], [0,5,10,15], [3,6,9,12]]
		end
	end

end