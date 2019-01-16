require_relative 'board'
require_relative 'cursor'
require 'colorize'
require_relative "piece"

class Display
  attr_reader :cursor, :board
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  # def render
  #   board[@cursor.cursor_pos].colorize(:blue)
  # end

  def render
    #underline = @board.grid[0].length.times.map {|i| "__"}.join("")
    variable = @board.grid.map.with_index do |row, rowidx1|
      row.map.with_index do |ele, colidx|
        if [rowidx1, colidx] == @cursor.cursor_pos 
          ele.to_s.colorize(:red)
          #ele.symbol.nil? ? "-".colorize(:red) : "P".colorize(:red)
        
        # elsif ele.symbol.nil? 
        #   ele.symbol.to_s
        else
          ele.to_s
        end
      end.join("|") 
    end.join("\n") 
    
    puts "#{variable}"
  end
  # def method_name

    
  # end


end