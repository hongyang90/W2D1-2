require_relative "piece"
class Board
  attr_reader :grid
  def initialize()
    @grid = Array.new(8) {Array.new(8)} 
    self.populate
  end

  def populate
    @grid[0].map! {|ele| ele = Piece.new()}
    @grid[1].map! {|ele| ele = Piece.new()}
    @grid[-2].map! {|ele| ele = Piece.new()}
    @grid[-1].map! {|ele| ele = Piece.new()}
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil? || !self[end_pos].nil?
      raise "Invalid move!"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
    self.grid
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def valid_pos?(pos)
    pos.all? { |el| el >= 0 && el < 8 }
  end


end