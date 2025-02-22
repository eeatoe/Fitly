class CreateJoinTableUsersFitnessGoals < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :fitness_goals do |t|
      t.index :user_id
      t.index :fitness_goal_id
    end
  end
end
