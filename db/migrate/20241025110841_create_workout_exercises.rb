class CreateWorkoutExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_exercises do |t|
      t.references :workout, polymorphic: true, null: false, index: true
      t.references :exercise, null: false, foreign_key: true

      t.integer :sets
      t.integer :reps
      t.decimal :weight

      t.timestamps
    end
  end
end
