class Board
  attr_reader :area

  def initialize
    @area = {}
    @area.default = nil
  end

  def set_at(pos, something)
    area[pos.key] = something
  end

  def at(pos)
    area[pos.key]
  end

  def around(pos)
    things_around = []
    positions_around(pos).each do |position_around|
      thing = at(position_around)
      things_around << thing unless thing.nil?
    end
    things_around
  end

  def for_every_position(&do_it)
    area.keys.each do |position_key|
      pos = Position.from(position_key)
      do_it.call(pos)
    end
  end

  private

  def positions_around(pos)
    locations = [pos.x - 1, pos.x, pos.x + 1].product([pos.y - 1, pos.y, pos.y + 1])
    locations.select! { |loc| loc != [pos.x, pos.y] }
    locations.map { |loc| Position.new(loc[0], loc[1]) }
  end
end
