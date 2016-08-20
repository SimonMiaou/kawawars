require 'test_helper'

module Coord
  class OffsetTest < ActiveSupport::TestCase
    def test_to_cube
      # TODO
    end

    def test_equals
      assert_equal Offset.new(0, 0), Offset.new(0, 0)
      refute_equal Offset.new(0, 0), Offset.new(0, 1)
      refute_equal Offset.new(0, 0), Offset.new(1, 0)
    end
  end
end
