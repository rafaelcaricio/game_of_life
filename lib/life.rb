class Life
  def initialize(board)
    @board = board
  end

  def events_in_current_generation
    events = []
    board.for_every_position do |position|
      events << LifeEvent.new(at: position) if does_something_happened_at?(position)
    end
    events
  end

  def does_something_happened_at?(position)
    relative_to = board.at(position)
    cells_around = board.around(position)
    alive_neighbors = how_many_alive?(cells_around)

    if relative_to.nil?
      to_dead_cell_with?(alive_neighbors)
    else
      to_alive_cell_with?(alive_neighbors)
    end
  end

  private

  def to_alive_cell_with?(number_alive_neighbors)
    number_alive_neighbors < 2 ||
      number_alive_neighbors > 3
  end

  def to_dead_cell_with?(number_alive_neighbors)
    number_alive_neighbors == 3
  end

  def how_many_alive?(cells)
    cells.select{ |cell| !cell.nil? }.size
  end

  attr_reader :board
end
