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
