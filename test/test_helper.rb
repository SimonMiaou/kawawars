ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Add more helper methods to be used by all tests here...

    def cube(x, y, z)
      Coord::Cube.new(x, y, z)
    end

    def hex(q, r)
      Coord::Hex.new(q, r)
    end
  end
end
