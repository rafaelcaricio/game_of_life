class GameOfLife
  attr_reader :board_size, :rounds, :board, :life

  def initialize(config = {})
    @rounds = config.fetch(:rounds, 10)
    @board_size = config.fetch(:board_size, 10)
    @board = create_board
    @life = Life.new(board)
  end

  def set_at(x, y, cell)
    board.set_at(Position.new(x, y), cell)
  end

  def run!
    for round in 1..rounds
      execute_round!(round)
    end
  end

  private

  def execute_round!(round)
    happens_a_new_generation!(round)
  end

  def create_board
    Board.new(size: board_size) { Cell.new(state: :dead) }
  end

  def happens_a_new_generation!(generation)
    make_happen(life.events_in_current_generation)
  end

  def make_happen(life_events)
    life_events.each { |life_event| life_event.happen(board) }
  end
end
