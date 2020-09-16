# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_15_181247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "body_areas", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "chat_participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_chat_participants_on_chatroom_id"
    t.index ["user_id"], name: "index_chat_participants_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.integer "diff_coef"
    t.integer "kcal"
    t.bigint "body_area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body_area_id"], name: "index_exercises_on_body_area_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "status"
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_friendships_on_recipient_id"
    t.index ["sender_id"], name: "index_friendships_on_sender_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "session_exercises", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_session_exercises_on_exercise_id"
    t.index ["session_id"], name: "index_session_exercises_on_session_id"
  end

  create_table "session_participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "favorite_status"
    t.index ["session_id"], name: "index_session_participants_on_session_id"
    t.index ["user_id"], name: "index_session_participants_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "difficulty"
    t.string "mode"
    t.datetime "date"
    t.boolean "video"
    t.integer "total_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "body_area_id"
    t.string "room_sid"
    t.index ["body_area_id"], name: "index_sessions_on_body_area_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "time"
    t.integer "kcal"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "twilio_token"
    t.datetime "twilio_expire"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chat_participants", "chatrooms"
  add_foreign_key "chat_participants", "users"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "exercises", "body_areas"
  add_foreign_key "friendships", "users", column: "recipient_id"
  add_foreign_key "friendships", "users", column: "sender_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "session_exercises", "exercises"
  add_foreign_key "session_exercises", "sessions"
  add_foreign_key "session_participants", "sessions"
  add_foreign_key "session_participants", "users"
  add_foreign_key "sessions", "body_areas"
  add_foreign_key "sessions", "users"
  add_foreign_key "stats", "users"
end
