class LifeEvent
  attr_reader :position

  def initialize(attrs)
    @position = attrs.fetch(:at)
  end

  def happen(to_cell)
    make_state_change(to_cell)
  end

  private

  def make_state_change(board)
    if board.at(position).nil?
      board.set_at(position, Cell.new)
    else
      board.kill(position)
    end
  end
end
