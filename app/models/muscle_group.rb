class MuscleGroup < ApplicationRecord
  has_and_belongs_to_many :exercises

  validates :name, presence: true, uniqueness: true
end
