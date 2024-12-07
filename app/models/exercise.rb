class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :user_workouts, through: :workout_exercises, source: :workout, source_type: 'UserWorkout'
  has_many :expert_workouts, through: :workout_exercises, source: :workout, source_type: 'ExpertWorkout'
  has_and_belongs_to_many :muscle_groups

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false, message: "has already been taken" },
            length: { within: 3..50,
                      too_short: "must be at least 3 characters",
                      too_long: "must be at most 50 characters" }
  validates :description, presence: true
  validates :link, format: { 
                    with: URI::regexp(%w[http https]), 
                    message: "must be a valid URL starting with http or https" 
                  },
            presence: true,
            uniqueness: true
end
