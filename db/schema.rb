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

ActiveRecord::Schema[7.1].define(version: 2025_02_06_073828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 254, null: false
    t.string "phone", limit: 18
    t.string "password_digest", limit: 64, null: false
    t.string "name", limit: 20, null: false
    t.date "birth_date", null: false
    t.boolean "is_expert", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "subscription_type", default: "free", null: false
    t.boolean "is_subscribed", default: false
    t.string "profile_picture_link"
    t.string "gender"
    t.integer "height"
    t.float "weight"
    t.string "fitness_goals"
    t.string "experience_level"
    t.string "refresh_token"
    t.datetime "refresh_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["refresh_token"], name: "index_users_on_refresh_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
