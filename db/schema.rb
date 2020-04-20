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

ActiveRecord::Schema.define(version: 2020_04_20_091314) do

  create_table "comments", force: :cascade do |t|
    t.datetime "createt_at"
    t.string "commented_text"
    t.integer "user_id"
    t.integer "photo_id"
    t.index ["photo_id"], name: "index_comments_on_photo_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "followings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follower_id"
    t.index ["follower_id"], name: "index_followings_on_follower_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "photo_id"
    t.index ["photo_id"], name: "index_likes_on_photo_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "createt_at"
    t.integer "likes_count"
    t.integer "user_id"
    t.integer "location_id"
    t.text "image_data"
    t.index ["location_id"], name: "index_photos_on_location_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "email"
    t.string "password"
  end

  add_foreign_key "comments", "photos"
  add_foreign_key "comments", "users"
  add_foreign_key "followings", "users"
  add_foreign_key "followings", "users", column: "follower_id"
  add_foreign_key "likes", "photos"
  add_foreign_key "likes", "users"
  add_foreign_key "photos", "locations"
  add_foreign_key "photos", "users"
end
