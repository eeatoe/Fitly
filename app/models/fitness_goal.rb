class FitnessGoal < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :workouts

  validates :name, presence: true, uniqueness: true
end
