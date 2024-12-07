class CreateJoinTableExercisesMuscleGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises_muscle_groups, id: false do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :muscle_group, null: false, foreign_key: true
    end

    # Добавление индексов для улучшения производительности
    add_index :exercises_muscle_groups, [:exercise_id, :muscle_group_id], unique: true
  end
end
