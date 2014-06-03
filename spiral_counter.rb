class SpiralCounter
  def initialize
    @value = 0
    @row = 0
    @col = 0
    @direction = :up
    @map = {@row => {@col => @value}}
  end

  def increment
    @value += 1
    direction = next_direction(@direction)
    row, col = next_position(@row, @col, direction)
    if @map[row] && @map[row][col]
      direction = @direction
      row, col = next_position(@row, @col, direction)
    end
    @map[row] = {} unless @map[row]
    @map[row][col] = @value
    @row, @col, @direction = row, col, direction
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

  def next_position(row, col, direction)
    case direction
    when :up
      row -= 1
    when :right
      col += 1
    when :down
      row += 1
    when :left
      col -= 1
    end
    [row, col]
  end
end
