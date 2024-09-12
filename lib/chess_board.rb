# frozen_string_literal: true

# Chess board on 2D Array
class Board
  SIZE = 8

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE, false) }
  end
end
