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

ActiveRecord::Schema.define(version: 20200326172416) do

  create_table "exercise_commitments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exercise_track_id"
  end

  create_table "exercise_track_days", force: :cascade do |t|
    t.integer "exercise_track_id"
    t.integer "exercise_id"
    t.string  "day"
    t.integer "sets"
    t.integer "reps"
  end

  create_table "exercise_tracks", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "date"
    t.string   "meal_time"
  end

  create_table "recipe_components", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
    t.string  "ingredient_amount"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "prep_time"
    t.string "instructions"
    t.string "category"
  end

  create_table "user_menus", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "news"
    t.boolean "weather"
    t.boolean "meals"
    t.boolean "exercise"
    t.boolean "reading"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.integer "role"
    t.string  "password_digest"
  end

end
