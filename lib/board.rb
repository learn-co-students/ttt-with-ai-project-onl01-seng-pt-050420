require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    @cells[position.to_i - 1]
  end 
    
  def full?
    @cells.each do |cell|
      if cell == " " 
        return false
      end
    end
    true
  end

  def turn_count
    count = @cells.reject { |c| c == " " }
    count.length
  end

  def taken?(position)
    index = position.to_i - 1
    @cells[index] != " " 
  end

  def valid_move?(position)
    if (1..9).include?(position.to_i)
      taken = taken?(position)
      taken == false
    end
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end


end