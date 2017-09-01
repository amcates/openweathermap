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

ActiveRecord::Schema.define(version: 20170901203920) do

  create_table "weather_measurements", force: :cascade do |t|
    t.string "zip_code"
    t.string "conditions"
    t.float "pressure"
    t.float "temp"
    t.float "wind_speed"
    t.float "wind_degrees"
    t.float "humidity"
    t.string "data_collected_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
