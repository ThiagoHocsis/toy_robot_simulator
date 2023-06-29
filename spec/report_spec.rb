require 'spec_helper'
require 'robot'
require 'position'
require 'board'
require 'commands/place'

describe 'Robot Report' do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new }
  describe 'can place robot in a position' do
    before do
      Place.new(board, robot, position).place_robot!
    end

    context 'with valid position' do
      let(:position) { Position.new(1, 1, 'WEST') }

      it 'must return the correct position' do
        expect(robot.report) == ('1, 1, WEST')
      end
    end

    context 'with invalid position' do
      let(:position) { Position.new(1, 11, 'WEST') }

      it 'must return nil' do
        expect(robot.report).to eq nil
      end
    end
  end
end