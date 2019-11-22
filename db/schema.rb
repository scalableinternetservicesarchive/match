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

ActiveRecord::Schema.define(version: 2019_11_22_203829) do

  create_table "games", force: :cascade do |t|
    t.integer "status"
    t.string "venue"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "result"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interest"
  end

  create_table "interests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "player_game_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.boolean "is_organizer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_interest_mappings", force: :cascade do |t|
    t.integer "user_id"
    t.string "interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_game_mapping.rb", force :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.boolean "Organizer" 

  create_table "players", force: :cascade do |t|
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
