# frozen_string_literal: true
require_relative 'board.rb'
require_relative 'robot.rb'
require_relative 'position.rb'
require_relative 'commands/place.rb'
require_relative 'commands/move.rb'
require_relative 'commands/right.rb'
require_relative 'commands/left.rb'

board = Board.new(5, 5)
robot = Robot.new


loop do
  puts 'Type a command to the robot or type exit to quit'
  command = gets.chomp.upcase
  break if command == 'EXIT'

  case command
  when /^PLACE\s+(\d+)\s*,\s*(\d+)\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
    Place.new(board, robot, Position.new($1.to_i, $2.to_i, $3)).place_robot!
  when 'REPORT'
    robot.report
  when 'MOVE'
    Move.new(robot, board).move
  when 'RIGHT', 'LEFT'
    Object.const_get(command.capitalize).new(robot).send("turn_#{command.downcase}")
  else
    puts 'Invalid command'
  end
end
