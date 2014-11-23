require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Board do
  let(:board) {
    Board.new(size: board_size) do
      something
    end
  }
  let(:board_size) { 3 }
  let(:some_position) { Position.new(1, 1) }
  let(:something) { :something }

  context "when initialize board" do
    it 'should have something at all positions' do
      for i in 0..(board_size - 1)
        for j in 0..(board_size - 1)
          expect(board.area[i][j]).to_not be_nil
        end
      end
    end
  end

  context "#set_at" do
    it 'set something at some position' do
      board.set_at(some_position, something)
      expect(board.area[some_position.x][some_position.y]).to eq(something)
    end
  end

  context '#at' do
    before do
      board.area[some_position.x][some_position.y] = something
    end

    it 'returns something at some position' do
      expect(board.at(some_position)).to eq(something)
    end
  end

  describe '#around' do
    let(:things) { [1,2,3,4,5,6,7,8] }
    before do
      # 0,0 0,1 0,2
      # 1,0     1,2
      # 2,0 2,1 2,2
      board.area[0][0] = 1
      board.area[0][1] = 2
      board.area[0][2] = 3
      board.area[1][0] = 4
      board.area[1][2] = 5
      board.area[2][0] = 6
      board.area[2][1] = 7
      board.area[2][2] = 8
    end

    it 'returns things around some position' do
      expect(board.around(some_position)).to eq(things)
    end
  end

  describe '#for_every_position' do
    let(:block) { double(:some_block, call: true) }

    it 'executes the block' do
      expect(block).to receive(:call).exactly(board_size * board_size).times

      board.for_every_position do |pos|
        block.call
      end
    end
  end
end
