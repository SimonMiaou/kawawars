class CreateHexagons < ActiveRecord::Migration[5.0]
  def change
    create_table :hexagons do |t|
      t.integer :coord_x, null: false, index: true
      t.integer :coord_y, null: false, index: true
      t.integer :coord_z, null: false, index: true
      t.timestamps
    end

    add_index :hexagons, [:coord_x, :coord_y, :coord_z], unique: true
  end
end
