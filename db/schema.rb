ActiveRecord::Schema.define(version: 2019_06_04_152749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lobbies", force: :cascade do |t|
    t.boolean "active"
    t.boolean "competitive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_lobbies_on_game_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lobby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_sessions_on_lobby_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "nickname"
    t.string "profile_pic"
    t.string "banner_pic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lobbies", "games"
  add_foreign_key "sessions", "lobbies"
  add_foreign_key "sessions", "users"
end
