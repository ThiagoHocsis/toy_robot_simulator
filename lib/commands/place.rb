class Place 
  def initialize(board, robot, position)
    @board = board
    @robot = robot
    @position = position
  end

  def place_robot!
    @board.valid_position?(@position) ? @robot.position = @position : puts("Invalid position. Please enter a valid position.")
  end
end