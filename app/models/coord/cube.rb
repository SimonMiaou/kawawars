module Coord
  class Cube
    attr_reader :x, :y, :z

    def initialize(x, y, z)
      raise 'x + y + z must equal 0' if (x + y + z).nonzero?
      @x = x
      @y = y
      @z = z
    end

    def to_hex
      Hex.new(x, z)
    end

    def to_cube
      self
    end

    def to_even_r_offset
      col = x + (z + (z & 1)) / 2
      row = z
      Coord::Offset.new(col, row)
    end
    alias to_offset to_even_r_offset

    def ==(other)
      c = other.to_cube
      x == c.x && y == c.y && z == c.z
    end

    def to_s
      "#{x}:#{y}:#{z}"
    end
  end
end
