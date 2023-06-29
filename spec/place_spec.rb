require "spec_helper"
require "robot"
require "position"
require "board"
require "commands/place"

describe 'Place Robot' do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new }
  describe 'can place robot in a position' do
    before do
      Place.new(board, robot, position).place_robot!
    end

    context "with valid position" do
      let(:position) { Position.new(1, 1, 'WEST') }

      it "places the robot in a valid position" do
        expect(robot.position).to eq(position)
      end
    end

    context "with invalid position" do
      let(:position) { Position.new(1, 11, 'WEST') }

      it "will not return the position of the robot" do
        expect(robot.position).to be nil
      end
    end
  end
end