require 'spec_helper'
require 'robot'
require 'position'
require 'board'
require 'commands/place'
require 'commands/right'

describe 'Move robot to right' do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new }
  let(:position) { Position.new(1, 1, 'EAST') }
  describe 'shifts the cardinal position of the robot to the right' do
    before do
      Place.new(board, robot, position).place_robot!
    end

    context 'with valid argument' do
      it 'change the robot orientation from east to south' do
        Right.new(robot).turn_right
        expect(robot.report) == ('1,1, SOUTH')
      end
    end
  end
end