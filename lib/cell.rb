class Cell
  attr_accessor :state

  def initialize(args = {})
    @state = args.fetch(:state)
  end

  def alive?
    state == :alive
  end

  def dead?
    state == :dead
  end
end
