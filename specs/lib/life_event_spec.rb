require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe LifeEvent do
  let(:board) { Board.new }
  let(:life_event) { LifeEvent.new(at: position) }
  let(:position) { Position.new(1, 1) }

  before { board.set_at(position, cell) }

  context 'when happens to position, the cell at that position' do
    subject { cell }

    before { life_event.happen(board) }

    context "when is alive" do
      let(:cell) { Cell.new(state: :alive) }
      its(:state) { should eq(:dead) }
    end

    context "when is dead" do
      let(:cell) { Cell.new(state: :dead) }
      its(:state) { should eq(:alive) }
    end
  end
end
