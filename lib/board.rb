
require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all?{|element| element != " " }
  end

  def turn_count
    @cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    self.position(position) != " "
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !(taken?(index))
  end

  def update(index, player)
    if valid_move?(index) && !taken?(index)
      @cells[index.to_i - 1] = player.token
    end
  end

  
end