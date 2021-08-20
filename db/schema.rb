# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_20_084325) do

  create_table "entries", force: :cascade do |t|
    t.string "meal_type"
    t.integer "calories"
    t.integer "proteins"
    t.integer "carbohydrates"
    t.integer "fats"
    t.date "diary_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "title"
    t.integer "food_calories"
    t.integer "food_proteins"
    t.integer "food_carbohydrates"
    t.integer "food_fats"
    t.integer "entry_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entry_id"], name: "index_foods_on_entry_id"
  end

  add_foreign_key "foods", "entries"
end
