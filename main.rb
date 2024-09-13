# frozen_string_literal: true

require_relative('lib/chess_board')

Board.new.knight_moves([3, 3], [5, 4])
Board.new.knight_moves([0, 0], [7, 7])
Board.new.knight_moves([1, 2], [3, 4])
Board.new.knight_moves([5, 6], [7, 0])
