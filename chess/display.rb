require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_reader :cursor
  def initialize()
   @cursor = Cursor.new([0,0], board)
  end

  def render
    board[@cursor.cursor_pos].colorize(:blue)
  end

  # def method_name

    
  # end


end