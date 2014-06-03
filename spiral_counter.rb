class SpiralCounter
  def initialize
    @value = 0
    @x = 0
    @y = 0
    @direction = :up
    @map = {[@x, @y] => @value}
  end

  def increment
    @value += 1
    direction = next_direction(@direction)
    x, y = next_coords(@x, @y, direction)
    if @map[[x, y]]
      direction = @direction
      x, y = next_coords(@x, @y, direction)
    end
    @map[[x, y]] = @value
    @x, @y, @direction = x, y, direction
  end

  def to_s
    @map.inspect
  end

  private

  def next_direction(direction)
    {:up    => :right,
     :right => :down,
     :down  => :left,
     :left  => :up}[direction]
  end

  def next_coords(x, y, direction)
    case direction
    when :up
      y -= 1
    when :right
      x += 1
    when :down
      y += 1
    when :left
      x -= 1
    end
    [x, y]
  end
end
