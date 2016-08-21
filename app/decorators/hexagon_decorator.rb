class HexagonDecorator < SimpleDelegator
  HEXAGON_HEIGHT = 60
  HEXAGON_PEAK_HEIGHT = 30
  HEXAGON_WIDTH = 104
  HEXAGON_HALF_WIDTH = HEXAGON_WIDTH / 2

  def css_position(border_size: 4, center_col: -HEXAGON_HALF_WIDTH, center_row: -HEXAGON_HEIGHT)
    offset = to_offset
    top = center_row + offset.row * ((HEXAGON_HEIGHT + HEXAGON_PEAK_HEIGHT) + border_size)
    left = center_col + (offset.col * (HEXAGON_WIDTH + border_size))
    left -= ((HEXAGON_HALF_WIDTH + (border_size / 2)) * (offset.row & 1)) if offset.row & 1 == 1
    "position: absolute;top: #{top}px; left: #{left}px;"
  end
end
