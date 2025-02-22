class FitnessGoal < ApplicationRecord

  # Константы (constants)
  VALID_FITNESS_GOALS = %w[fat_loss, muscle_gain, maintenance, endurance_training, strength_training, flexibility, functional_fitness].freeze

  # Связи (associations)
  has_and_belongs_to_many :users
  has_and_belongs_to_many :workouts

  # Валидации (validations)
  validates :name, presence: true, 
    inclusion: { in: VALID_FITNESS_GOALS },
    uniqueness: true
end
