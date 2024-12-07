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

ActiveRecord::Schema[7.1].define(version: 2024_10_25_120328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.text "equipment_needed"
    t.text "link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises_muscle_groups", id: false, force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "muscle_group_id", null: false
    t.index ["exercise_id", "muscle_group_id"], name: "idx_on_exercise_id_muscle_group_id_d23386c90d", unique: true
    t.index ["exercise_id"], name: "index_exercises_muscle_groups_on_exercise_id"
    t.index ["muscle_group_id"], name: "index_exercises_muscle_groups_on_muscle_group_id"
  end

  create_table "expert_workouts", force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.string "description", null: false
    t.string "workout_category", null: false
    t.integer "duration", null: false
    t.integer "calories_burned"
    t.string "difficulty_level"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "calories_burned > 50", name: "calories_burned_greater_than_5"
    t.check_constraint "duration > 5", name: "duration_greater_than_5"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", limit: 50, null: false
    t.string "description", null: false
    t.string "workout_category", null: false
    t.integer "duration", null: false
    t.integer "calories_burned"
    t.string "difficulty_level"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_workouts_on_user_id"
    t.check_constraint "calories_burned > 50", name: "user_workouts_calories_burned_greater_than_50"
    t.check_constraint "duration > 5", name: "user_workouts_duration_greater_than_5"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", limit: 64, null: false
    t.string "name", limit: 20, null: false
    t.date "birth_date", null: false
    t.string "gender"
    t.integer "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.string "workout_type", null: false
    t.bigint "workout_id", null: false
    t.bigint "exercise_id", null: false
    t.integer "sets"
    t.integer "reps"
    t.decimal "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["workout_type", "workout_id"], name: "index_workout_exercises_on_workout"
  end

  add_foreign_key "exercises_muscle_groups", "exercises"
  add_foreign_key "exercises_muscle_groups", "muscle_groups"
  add_foreign_key "user_workouts", "users"
  add_foreign_key "workout_exercises", "exercises"
end
