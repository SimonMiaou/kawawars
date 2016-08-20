class HexagonsController < ApplicationController
  def index
    @hexagons = Hexagon.all.map { |h| HexagonDecorator.new(h) }
  end

  def create
    hexagon = Hexagon.new(create_params)

    if hexagon.valid?
      hexagon.save!
      redirect_to hexagons_path, notice: "Hexagon #{hexagon.coords_to_s} was created"
    else
      redirect_to hexagons_path, notice: hexagon.errors.full_messages
    end
  end

  private

  def create_params
    params.require(:hexagon)
          .permit(:coord_x, :coord_y)
  end
end
