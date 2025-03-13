class CreateJoinTableWorkoutsFitnessGoals < ActiveRecord::Migration[7.1]
  def change
    create_join_table :workouts, :fitness_goals do |t|
      t.index :workout_id
      t.index :fitness_goal_id
    end
  end
end
