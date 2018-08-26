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

ActiveRecord::Schema.define(version: 2018_08_26_023558) do

  create_table "designers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expansion_designers", force: :cascade do |t|
    t.integer "expansion_id"
    t.integer "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designer_id"], name: "index_expansion_designers_on_designer_id"
    t.index ["expansion_id"], name: "index_expansion_designers_on_expansion_id"
  end

  create_table "expansions", force: :cascade do |t|
    t.string "name"
    t.integer "pcount"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "owned"
    t.integer "publisher_id"
    t.integer "game_id"
    t.index ["game_id"], name: "index_expansions_on_game_id"
    t.index ["publisher_id"], name: "index_expansions_on_publisher_id"
  end

  create_table "game_designers", force: :cascade do |t|
    t.integer "game_id"
    t.integer "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designer_id"], name: "index_game_designers_on_designer_id"
    t.index ["game_id"], name: "index_game_designers_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "pcount"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "owned"
    t.integer "publisher_id"
    t.index ["publisher_id"], name: "index_games_on_publisher_id"
  end

  create_table "logs", force: :cascade do |t|
    t.date "date"
    t.integer "game_id"
    t.integer "expansion_id"
    t.integer "pcount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["game_id"], name: "index_logs_on_game_id"
  end

  create_table "player_scores", force: :cascade do |t|
    t.integer "player_id"
    t.integer "log_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_id"], name: "index_player_scores_on_log_id"
    t.index ["player_id"], name: "index_player_scores_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
