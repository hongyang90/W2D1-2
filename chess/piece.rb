class Piece
  attr_reader :name 
  def initialize()
    @name = name
  end
end

class NullPiece < Piece
  #include Singleton
  def initialize
    super
  end
end