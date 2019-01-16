module Stepable

  def moves
    moves = self.moves_diffs.map do |ele|
      ele[0] += self.pos[0]
      ele[1] += self.pos[1]
    end 
    moves
  end
  
  def moves_diffs
  end
end