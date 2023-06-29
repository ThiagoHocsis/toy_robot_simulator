class Robot
  attr_accessor :position
  
  def initialize
    @position = nil
  end

  def report
    puts it_placed_in_position?
  end

  def it_placed_in_position?
    @position.nil? ? 'not placed' : [@position.x_coordinate, @position.y_coordinate, @position.direction].join(",")
  end
end