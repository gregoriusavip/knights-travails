# frozen_string_literal: true

require_relative('knight')

# Chess board on 2D Array
class Board
  SIZE = 8

  attr_accessor :board

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) }
  end

  def knight_moves(pos, target)
    step = knight_moves_helper(pos, target)
    p "You made it in #{step} move(s)! Here's your path:"
    puts extract_path(target, pos) # trace from target back to position
  end

  private

  def knight_moves_helper(pos, target)
    @board[pos[1]][pos[0]] = [pos[0], pos[1]]
    step = 0

    return step if pos.eql? target

    bfs_target(pos, target, step)
  end

  def bfs_target(pos, target, step, queue = [pos, nil])
    until queue.empty?
      move = queue.shift

      if move.nil?
        step += 1
        queue << nil unless queue.empty?
      else
        queue_next(move, queue) { |x, y| return step + 1 if [x, y].eql? target }
      end
    end
    step
  end

  def queue_next(move, queue)
    Knight.movement(move[0], move[1]) do |x, y|
      next unless @board[y][x].nil?

      @board[y][x] = [move[0], move[1]]
      yield(x, y)
      queue << [x, y]
    end
  end

  def extract_path(pos, target)
    return pos.to_s if pos.eql? target

    res = pos
    cur_pos = @board[pos[1]][pos[0]]
    until cur_pos.eql? target
      res = "#{cur_pos}\n#{res}"
      cur_pos = @board[cur_pos[1]][cur_pos[0]]
    end
    "#{cur_pos}\n#{res}"
  end
end
