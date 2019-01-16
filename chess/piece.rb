require_relative 'stepable'
require 'singleton'
require_relative 'slideable'
require 'colorize'

class Piece
  attr_reader :color, :board, :pos
  attr_writer :pos
  def initialize(color, board, pos)
    @color = color #symbol
    @board = board
    @pos = pos
  end

  def to_s
    self.symbol.to_s
  end

  def empty?
    if self.class == NullPiece 
      return true
    else 
      return false
    end 
  end

  def valid_moves
  end

  # def pos=(val)
  #   @pos = val
  # end

  # def symbol
    
  # end

  private

  def move_into_check?(pos)
  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize()
    @symbol = nil
  end

  def moves
    []
  end

  def to_s
    "-"
  end
end

class Queen < Piece # "\u2655" white
  attr_reader :symbol
  include Slideable

  def initialize
    @symbol = "\u265b".to_sym
  end

  def move_dirs
    queen_dirs = []

    queen_dirs.concat(self.horizontal_dirs)
    queen_dirs.concat(self.diagonal_dirs)

    queen_dirs
  end
end

class Rook < Piece # "\u2656" white 
  attr_reader :symbol
  include Slideable

  def initialize
    @symbol = "\u2656".to_sym
  end

  def move_dirs
    self.horizontal_dirs
  end
end

class Bishop < Piece # "\u2657" white
  attr_reader :symbol
  include Slideable

  def initialize
    @symbol = "\u265d".to_sym
  end

  def move_dirs
    self.diagonal_dirs
  end
end

class Knight < Piece # "\u2658" white s
  include Stepable
  attr_reader :symbol
  def move_difs
   diffs = [[1, 2], [2, 1], [-1, 2], [-1, -2],
      [-2, 1], [-2, -1], [1, -2], [2, -1]]
  end

  def initialize
    @symbol = "\u265e".to_sym
  end

end

class King < Piece #"\u2654" white
  include Stepable
  attr_reader :symbol
  
  def initialize
    @symbol = "\u265a".to_sym
  end

  def move_diffs
    diffs = [[1, 1], [-1, 1], [-1, -1], [1, -1],
      [1, 0], [-1, 0], [0, 1], [0, -1]]
  end
end

class Pawn < Piece #while "\u2659"
  attr_reader :symbol

  def initialize
    @symbol = "\u265f".to_sym #black
  end
  # def symbol(symbol)
  # end

  def move_dirs
    moves = []

    if at_start_row? 
      moves << [0, 1]
      moves << [0, 2]
      moves << [0, -1]
      moves << [0, -2]

    else
      moves << [0, 1]
      moves << [0, -1]
    end

    moves
  end

  def at_start_row?
    return true if self.pos[0] == 1 || self.pos[0] == 6

    false
  end
end