class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.text :name, null: false, index: { unique: true }
      t.text :description, null: false
      t.text :equipment_needed
      t.text :link, null: false

      t.timestamps
    end
  end
end
