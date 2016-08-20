namespace :seed do
  task hexagons: :environment do
    (-3..3).each do |x|
      (-3..3).each do |y|
        hex = Hexagon.new(coord_x: x, coord_y: y)
        hex.save if hex.coord_z >= -3 && hex.coord_z <= 3
      end
    end
  end
end
