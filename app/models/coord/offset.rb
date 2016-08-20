module Coord
  class Offset
    attr_reader :col, :row

    def initialize(col, row)
      @col = col
      @row = row
    end

    def ==(other)
      col == other.col && row == other.row
    end

    def to_s
      "#{col}:#{row}"
    end
  end
end
