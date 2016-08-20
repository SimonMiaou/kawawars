# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160731163706) do

  create_table "hexagons", force: :cascade do |t|
    t.integer  "coord_x",    null: false
    t.integer  "coord_y",    null: false
    t.integer  "coord_z",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coord_x", "coord_y", "coord_z"], name: "index_hexagons_on_coord_x_and_coord_y_and_coord_z", unique: true
    t.index ["coord_x"], name: "index_hexagons_on_coord_x"
    t.index ["coord_y"], name: "index_hexagons_on_coord_y"
    t.index ["coord_z"], name: "index_hexagons_on_coord_z"
  end

end
