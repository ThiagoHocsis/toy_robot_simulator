class Board
  def initialize(width, height)
    @width = width
    @height = height
  end

  def valid_position?(position)
    position.x_coordinate.between?(0, @height - 1) && position.y_coordinate.between?(0, @width - 1)
  end
end
