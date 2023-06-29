class Right
  def initialize(robot)
    @robot = robot
  end

  def turn_right
    return unless @robot.it_placed_in_position?

    @robot.position = Position.new(@robot.position.x_coordinate,
                                   @robot.position.y_coordinate,
                                   @robot.position.to_right)
  end
end