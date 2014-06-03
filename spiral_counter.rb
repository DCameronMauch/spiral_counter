class SpiralCounter
  def initialize
    @value = 0
    @row = 0
    @col = 0
    @direction = :up
    @map = {@row => {@col => @value}}
  end

  def increment
    clear_memo
    turn_or_forward
    @value += 1
    @map[@row] = {} unless @map[@row]
    @map[@row][@col] = @value
  end

  def to_s
    rows.map { |row|
      cols.map { |col|
        "%#{width}s" % @map[row][col]
      }.join(' ')
    }.join("\n")
  end

  private

  def turn_or_forward
    direction = next_direction(@direction)
    turn = next_position(direction)
    forward = next_position(@direction)
    @row, @col = taken(*turn) ? forward : turn
    @direction = direction unless taken(*turn)
  end

  def taken(row, col)
    @map[row] && @map[row][col]
  end

  def clear_memo
    @rows = @cols = @width = nil
  end

  def rows
    @rows ||= @map.keys.sort
  end

  def cols
    @cols ||= @map.reduce([]) { |memo, (_, cols)|
      memo += cols.keys
    }.uniq.sort
  end

  def width
    @width ||= @value.to_s.length
  end

  def next_direction(direction)
    {:up    => :right,
     :right => :down,
     :down  => :left,
     :left  => :up}[direction]
  end

  def next_position(direction)
    row = @row
    col = @col
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
