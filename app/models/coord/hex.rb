module Coord
  class Hex
    attr_reader :q, :r

    def initialize(q, r)
      @q = q
      @r = r
    end

    def to_hex
      self
    end

    def to_cube
      x = q
      z = r
      y = - x - z
      Cube.new(x, y, z)
    end

    delegate :to_offset, to: :to_cube
    delegate :to_even_r_offset, to: :to_cube

    def ==(other)
      h = other.to_hex
      q == h.q && r == h.r
    end

    def to_s
      "#{q}:#{r}"
    end
  end
end
