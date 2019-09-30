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

ActiveRecord::Schema.define(version: 2019_09_30_180050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleted_coins", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "value"
    t.index ["user_id"], name: "index_colleted_coins_on_user_id"
  end

  create_table "deaths", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deaths_on_user_id"
  end

  create_table "killed_monsters", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "monster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monster_id"], name: "index_killed_monsters_on_monster_id"
    t.index ["user_id"], name: "index_killed_monsters_on_user_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
  end

  create_table "trophies", force: :cascade do |t|
    t.integer "quantity", null: false
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_trophies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

  add_foreign_key "colleted_coins", "users"
  add_foreign_key "deaths", "users"
  add_foreign_key "killed_monsters", "monsters"
  add_foreign_key "killed_monsters", "users"
  add_foreign_key "trophies", "users"
end
