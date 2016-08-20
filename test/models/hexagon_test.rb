require 'test_helper'

class HexagonTest < ActiveSupport::TestCase
  def test_initializes_coord_z_when_nil
    hexagon = Hexagon.new(coord_x: 0, coord_y: 0)
    assert_equal 0, hexagon.coord_z
  end

  def test_valid_coords
    assert Hexagon.new(coord_x: 0, coord_y: 0, coord_z: 0).valid?
  end

  def test_invalid_coords
    refute Hexagon.new(coord_x: 0, coord_y: 1, coord_z: 0).valid?
  end

  def test_coords_uniquness
    Hexagon.destroy_all
    Hexagon.create!(coord_x: 0, coord_y: 0)

    refute Hexagon.new(coord_x: 0, coord_y: 0).valid?
    assert Hexagon.new(coord_x: 1, coord_y: 1).valid?
    assert Hexagon.new(coord_x: 1, coord_y: 0).valid?
    Hexagon.destroy_all
  end
end
