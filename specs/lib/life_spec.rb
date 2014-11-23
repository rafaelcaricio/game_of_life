require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Life do
  let(:life) { Life.new(board) }
  let(:position) { Position.new(1, 1) }
  let(:board) {
    Board.new(size: 3) do
      Cell.new(state: :dead)
    end
  }

  context "#does_something_happened_at?" do
    before do
      allow(board).to receive(:at).with(position).and_return(cell)
      allow(board).to receive(:around).with(position).and_return(cells_around)
    end

    shared_examples "something happens" do
      it "happend some life event" do
        expect(life.does_something_happened_at?(position)).to be_truthy
      end
    end

    shared_examples "nothing happens" do
      it "does not happened any life event" do
        expect(life.does_something_happened_at?(position)).to be_falsey
      end
    end

    context "when theres less than two live neighbours dies" do
      let(:cells_around) { [ Cell.new(state: :alive) ] }

      context "when cell alive" do
        let(:cell) { Cell.new(state: :alive) }
        it_should_behave_like 'something happens'
      end

      context "when cell is dead" do
        let(:cell) { Cell.new(state: :dead) }
        it_should_behave_like 'nothing happens'
      end
    end

    context "when two or three live neighbours lives on to the next generation" do
      let(:cells_around) { [ Cell.new(state: :alive), Cell.new(state: :alive) ] }

      context "when cell alive" do
        let(:cell) { Cell.new(state: :alive) }
        it_should_behave_like 'nothing happens'
      end

      context "when cell is dead" do
        let(:cell) { Cell.new(state: :dead) }
        it_should_behave_like 'nothing happens'
      end
    end

    context "when more than three live neighbours dies" do
      let(:cells_around) { [ Cell.new(state: :alive), Cell.new(state: :alive), Cell.new(state: :alive), Cell.new(state: :alive) ] }

      context "when cell alive" do
        let(:cell) { Cell.new(state: :alive) }
        it_should_behave_like 'something happens'
      end

      context "when cell is dead" do
        let(:cell) { Cell.new(state: :dead) }
        it_should_behave_like 'nothing happens'
      end
    end

    context "when exactly three live neighbours becomes a live cell" do
      let(:cells_around) { [ Cell.new(state: :alive), Cell.new(state: :alive), Cell.new(state: :alive) ] }

      context "when cell alive" do
        let(:cell) { Cell.new(state: :alive) }
        it_should_behave_like 'nothing happens'
      end

      context "when cell is dead" do
        let(:cell) { Cell.new(state: :dead) }
        it_should_behave_like 'something happens'
      end
    end
  end

  context "#gevents_in_current_generation" do
    before do
      allow(life).to receive(:does_something_happened_at?).with(position).and_return(true)

      allow(board).to receive(:for_every_position) do |&block|
        block.call(position)
      end
    end

    context "when something happend at some position it returns" do
      subject { life.events_in_current_generation }

      its(:size) { should eq(1) }

      it 'returns a life event at position' do
        expect(subject.first.position).to eq(position)
      end
    end
  end
end
