class CreateFitnessGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :fitness_goals do |t|
      t.string :name, null: false
      
      t.timestamps
    end
  end
end
