class Hexagon < ApplicationRecord
  # validates :coord_x, presence: true,
  #                     uniqueness: { scope: [:coord_y, :coord_z] }
  # validates :coord_y, presence: true,
  #                     uniqueness: { scope: [:coord_x, :coord_z] }
  # validates :coord_z, presence: true,
  #                     uniqueness: { scope: [:coord_x, :coord_y] }
  # validates :coord_x, :coord_y, :coord_z, presence: true,
  #                                         uniqueness: { scope: [:coord_x, :coord_y, :coord_z] }
  validates :coord_x, :coord_y, :coord_z, presence: true
  validates :coord_x, uniqueness: { scope: [:coord_x, :coord_y, :coord_z], message: 'Coords must be uniq' }
  validate :validate_coords

  def initialize(attributes = {})
    super(attributes)
    init_z_if_empty
  end

  def to_coord
    Coord::Cube.new(coord_x, coord_y, coord_z)
  end
  delegate :to_cube, :to_hex, :to_offset, to: :to_coord

  # Should be in a decorator or similar
  def css_position(border_size: 4, center_col: -52, center_row: -60)
    top = center_row + to_offset.row * (90 + border_size)
    left = center_col + (to_offset.col * (104 + border_size))
    left -= ((52 + (border_size / 2)) * (to_offset.row & 1)) if to_offset.row & 1 == 1
    "position: absolute;top: #{top}px; left: #{left}px;"
  end

  private

  def init_z_if_empty
    return if coord_z
    return if coord_x.blank? || coord_y.blank?
    self.coord_z = 0 - coord_x - coord_y
  end

  def validate_coords
    return if coord_x.blank? || coord_y.blank? || coord_z.blank?
    errors.add(:base, 'coord_x + coord_y + coord_z must equal 0') if (coord_x + coord_y + coord_z).nonzero?
  end
end
