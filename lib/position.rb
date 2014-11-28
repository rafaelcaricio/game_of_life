class Position < Struct.new(:x, :y)
  def key
    "#{x}|#{y}"
  end

  def self.from(key)
    values = key.split('|')
    Position.new(values[0].to_i, values[1].to_i)
  end
end
