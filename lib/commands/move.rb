# frozen_string_literal: true

class Move
  def initialize(robot = nil, board = nil, position = nil)
    @robot = robot
    @board = board
    @position = position
  end

  def move
    new_position = @robot.position.go_to(@robot.position.direction)
    @robot.position = new_position if @robot.it_placed_in_position? && @board.valid_position?(new_position)
  end
end