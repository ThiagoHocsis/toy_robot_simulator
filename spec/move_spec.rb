require 'spec_helper'
require 'robot'
require 'position'
require 'board'
require 'commands/place'
require 'commands/move'

describe 'Move robot' do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new }
  let(:position) { Position.new(1, 1, 'WEST') }
  describe 'can move robot in a position' do
    before do
      Place.new(board, robot, position).place_robot!
    end

    context "with valid position" do
      it "places the robot in a valid new position" do
        Move.new(robot, board).move
        expect(robot.report) == ('1,0, WEST')
      end
    end

    context "with invalid position" do
      let(:position) { Position.new(0, 0, 'SOUTH') }
      it "the position of the robot will not change" do
        Move.new(robot, board).move
        expect(robot.report) == ('0, 0, SOUTH')
      end
    end
  end
end