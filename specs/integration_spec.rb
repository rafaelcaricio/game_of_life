require File.join(File.dirname(__FILE__), "spec_helper")

describe 'In a controlled environment' do
  let(:board) { Board.new(size: 3) { Cell.new(state: :dead) } }
  let(:life) { Life.new(board) }
  let(:target_position) { Position.new(1, 1) }

  before do
    board.set_at(target_position, Cell.new(state: :alive))
  end

  context "when get the current generation" do
    let(:life_events) { life.events_in_current_generation }
    let(:life_event) { life_events.first }

    it 'should return one event' do
      expect(life_events.size).to eq(1)
    end

    context 'its position' do
      subject { life_event.position }

      its(:x) { target_position.x }
      its(:y) { target_position.y }
    end
  end
end
