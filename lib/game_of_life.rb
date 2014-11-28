class GameOfLife
  attr_reader :rounds, :board, :life

  def initialize(config = {})
    @rounds = config.fetch(:rounds, 10)
    @board = Board.new
    @life = Life.new(board)
  end

  def set_at(x, y, cell)
    board.set_at(Position.new(x, y), cell)
  end

  def run!
    for round in 1..rounds
      happens_a_new_generation!(round)
    end
  end

  private

  def happens_a_new_generation!(generation)
    make_happen(life.events_in_current_generation)
  end

  def make_happen(life_events)
    life_events.each { |life_event| life_event.happen(board) }
  end
end
