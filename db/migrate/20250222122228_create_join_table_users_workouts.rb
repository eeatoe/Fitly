class CreateJoinTableUsersWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :user_workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
      t.boolean :is_favorite, default: false

      t.timestamps
    end
  end
end
