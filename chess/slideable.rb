module Slideable

  def move_dirs
  end

  def moves
    moves = []

    if self.class == Rook
      moves = self.horizontal_dirs.map do |el| 
        el[0] += self.pos[0]
        el[1] += self.pos[1]
      end
    elsif self.class == Bishop
      moves = self.diagonal_dirs.map do |el| 
        el[0] += self.pos[0]
        el[1] += self.pos[1]
      end
    elsif self.class == Queen
      horz = self.horizontal_dirs.map do |el| 
        el[0] += self.pos[0]
        el[1] += self.pos[1]
      end
      diag = self.diagonal_dirs.map do |el| 
        el[0] += self.pos[0]
        el[1] += self.pos[1]
      end

      moves = horz.concat(diag)
    end

    moves
  end

  def horizontal_dirs
    horz = []
    8.times {|ele| horz << [0,i]}
    8.times {|ele| horz << [0,-i]}
    8.times {|ele| horz << [i,0]}
    8.times {|ele| horz << [-i,0]}
    horz 
  end

  def diagonal_dirs
    diag = []
    8.times { |ele| diag << [ele, ele] }
    8.times { |ele| diag << [ele, -ele] }
    8.times { |ele| diag << [-ele, ele] }
    8.times { |ele| diag << [-ele, -ele] }

    diag
  end
end