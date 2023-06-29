# frozen_string_literal: true

class Position

  CARDINAL_POINTS = %w[NORTH EAST SOUTH WEST].freeze

  attr_reader :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def to_left
    CARDINAL_POINTS.rotate(-1)[CARDINAL_POINTS.index(direction)]
  end

  def to_right
    CARDINAL_POINTS.rotate(1)[CARDINAL_POINTS.index(direction)]
  end

  def go_to(direction)
    movements = {
      'NORTH' => method(:north),
      'EAST' => method(:east),
      'SOUTH' => method(:south),
      'WEST' => method(:west)
    }
    movements[direction].call if movements.key?(direction)
  end

  private

  def north
    Position.new(@x_coordinate, @y_coordinate + 1, @direction)
  end

  def south
    Position.new(@x_coordinate, @y_coordinate - 1, @direction)
  end

  def west
    Position.new(@x_coordinate - 1, @y_coordinate, @direction)
  end

  def east
    Position.new(@x_coordinate + 1, @y_coordinate, @direction)
  end
end
