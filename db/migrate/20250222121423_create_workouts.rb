class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.integer :duration, null: false
      t.integer :difficulty_level, default: 0, null: false
      t.text :location, array: true, default: [] # Может быть несколько значений

      t.boolean :is_public, default: false
      t.boolean :is_expert, default: false

      t.timestamps
    end
  end
end
