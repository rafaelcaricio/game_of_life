class LifeEvent
  attr_reader :position

  def initialize(attrs)
    @position = attrs.fetch(:at)
  end

  def happen(to_cell)
    make_state_change(to_cell.at(position))
  end

  private

  def make_state_change(cell)
    return cell.state = :dead if cell.alive?
    return cell.state = :alive if cell.dead?
  end
end
