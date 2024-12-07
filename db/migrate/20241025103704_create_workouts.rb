class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: true
      
      t.string :title, limit: 50, null: false
      t.string :description, null: false
      t.string :workout_category, null: false
      t.integer :duration, null: false

      t.integer :calories_burned
      t.string :difficulty_level
      t.string :location

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE workouts 
      ADD CONSTRAINT workouts_duration_greater_than_5 
      CHECK (duration > 5);
    SQL

    execute <<-SQL
      ALTER TABLE workouts 
      ADD CONSTRAINT workouts_calories_burned_greater_than_50 
      CHECK (calories_burned > 50);
    SQL
  end
end
