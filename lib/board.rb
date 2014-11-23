class Board
  attr_reader :area, :size

  def initialize(args, &content_for_each_position)
    @size = args.fetch(:size, 3)
    @area = for_each_line_of(Array.new) do
      for_each_line_of(Array.new) do
        content_for_each_position.call()
      end
    end
  end

  def set_at(pos, something)
    area[pos.x][pos.y] = something
  end

  def at(pos)
    area[pos.x][pos.y]
  end

  def around(pos)
    things_around = []
    positions_around(pos).each do |position_around|
      things_around << at(position_around) if valid_position?(position_around)
    end
    things_around
  end

  def for_every_position(&do_it)
    for i in 0..(size - 1)
      for j in 0..(size - 1)
        do_it.call(Position.new(i, j))
      end
    end
  end

  private

  def valid_position?(pos)
    pos.x < size && pos.y < size && pos.x >= 0 && pos.y >= 0
  end

  def positions_around(pos)
    locations = [pos.x - 1, pos.x, pos.x + 1].product([pos.y - 1, pos.y, pos.y + 1])
    locations.select! { |loc| loc != [pos.x, pos.y] }
    locations.map { |loc| Position.new(loc[0], loc[1]) }
  end

  def for_each_line_of(line)
    for i in 0..(size - 1)
      line << yield(i)
    end
    line
  end
end
