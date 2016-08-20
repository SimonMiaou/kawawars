require 'test_helper'

module Coord
  class CubeTest < ActiveSupport::TestCase
    def test_invalid
      assert_raises Exception do
        cube(0, 1, 0)
      end
    end

    def test_to_hex
      assert_equal hex(0, 1), cube(0, -1, 1).to_hex
      assert_equal hex(1, -1), cube(1, 0, -1).to_hex
      assert_equal hex(1, -2), cube(1, 1, -2).to_hex
      assert_equal hex(2, -1), cube(2, -1, -1).to_hex
    end

    def test_equals
      assert_equal cube(0, 0, 0), cube(0, 0, 0)
      refute_equal cube(0, 0, 0), cube(1, -1, 0)
      refute_equal cube(0, 0, 0), cube(1, 1, -2)
    end
  end
end
