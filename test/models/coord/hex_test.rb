require 'test_helper'

module Coord
  class HexTest < ActiveSupport::TestCase
    def test_to_cube
      assert_equal cube(0, -1, 1), hex(0, 1).to_cube
      assert_equal cube(1, 0, -1), hex(1, -1).to_cube
      assert_equal cube(1, -2, 1), hex(1, 1).to_cube
    end

    def test_equals
      assert_equal hex(0, 0), hex(0, 0)
      refute_equal hex(0, 0), hex(0, 1)
      refute_equal hex(0, 0), hex(1, 0)
    end
  end
end
