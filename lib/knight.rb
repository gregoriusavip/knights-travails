# frozen_string_literal: true

# Knight Piece
class Knight
  def self.movement(pos_x, pos_y)
    return unless pos_x.between?(0, 7) && pos_y.between?(0, 7)

    moves = [[2, 1], [1, 2], [2, -1], [-1, 2], [-2, 1], [1, -2], [-2, -1], [-1, -2]]

    moves.each do |move|
      x = pos_x + move[0]
      y = pos_y + move[1]
      yield(x, y) if x.between?(0, 7) && y.between?(0, 7)
    end
  end
end
