class Workout < ApplicationRecord

  # Связи (associations)
  has_many :user_workouts
  has_many :users, through: :user_workouts
  has_and_belongs_to_many :fitness_goals
end
