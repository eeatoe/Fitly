class WorkoutExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout, polymorphic: true

  validates :sets, presence: true
  validates :reps, presence: true
end