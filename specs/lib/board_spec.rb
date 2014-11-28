require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Board do
  let(:board) {
    Board.new
  }
  let(:board_size) { 3 }
  let(:some_position) { Position.new(1, 1) }
  let(:something) { :something }

  context 'get and set something at some position' do
    it 'set something at some position' do
      board.set_at(some_position, something)
      expect(board.at(some_position)).to eq(something)
    end
  end

  describe '#around' do
    let(:things) { [1,2,3,4,5,6,7,8] }
    before do
      # 0,0 0,1 0,2
      # 1,0     1,2
      # 2,0 2,1 2,2
      board.set_at(Position.new(0, 0), 1)
      board.set_at(Position.new(0, 1), 2)
      board.set_at(Position.new(0, 2), 3)
      board.set_at(Position.new(1, 0), 4)
      board.set_at(Position.new(1, 2), 5)
      board.set_at(Position.new(2, 0), 6)
      board.set_at(Position.new(2, 1), 7)
      board.set_at(Position.new(2, 2), 8)
    end

    it 'returns things around some position' do
      expect(board.around(some_position)).to eq(things)
    end
  end

  describe '#for_every_position' do
    let(:block) { double(:some_block, call: true) }
    let(:number_of_things_in_the_board) { board_size }
    before do
      for i in 1..number_of_things_in_the_board
        board.set_at(Position.new(0, i), something)
      end
    end

    it 'executes the block' do
      expect(block).to receive(:call).exactly(number_of_things_in_the_board).times

      board.for_every_position do |pos|
        block.call
      end
    end
  end
end
