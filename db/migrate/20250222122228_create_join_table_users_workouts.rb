class CreateJoinTableUsersWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :users_workouts do |t|
      t.references :user, foreign_key: true, null: false
      t.references :workout, foreign_key: true, null: false
      
      t.boolean :is_favorite, default: false, null: false

      t.timestamps
    end
  end
end
