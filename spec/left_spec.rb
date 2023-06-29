require 'spec_helper'
require 'robot'
require 'position'
require 'board'
require 'commands/place'
require 'commands/left'

describe 'Move robot to left' do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new }
  let(:position) { Position.new(1, 1, 'EAST') }
  describe 'shifts the cardinal position of the robot to the left' do
    before do
      Place.new(board, robot, position).place_robot!
    end

    context "with valid argument" do
      it 'change the robot orientation from east to NORTH' do
        Left.new(robot).turn_left
        expect(robot.report) == ('1,1, NORTH')
      end
    end
  end
end