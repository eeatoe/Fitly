class Workout < ApplicationRecord
  include Constants

  belongs_to :user
  has_many :workout_exercises, as: :workout, dependent: :destroy
  has_many :exercises, through: :workout_exercises

  validates :title,
            presence: true,
            format: { with: /\A[A-Za-z0-9.,:&\/\s]+\z/, message: "can only include letters, punctuation marks, and symbols: / and &" },
            length: { within: 4..50,
                      too_short: "must be at least 4 characters",
                      too_long: "must be at most 50 characters" }

  validates :description, presence: true
  validates :workout_category, 
            presence: true,
            inclusion: { in: WORKOUT_CATEGORY, message: "%{value} is not a valid workout category" }

  validates :duration, presence: true, numericality: { greater_than: 5 }
  validates :calories_burned, numericality: { greater_than: 50 }
  validates :difficulty_level,
            presence: true,
            inclusion: { in: DIFFICULTY_LEVEL, message: "%{value} is not a valid difficulty level" }

  validates :location, inclusion: { in: LOCATIONS, message: "%{value} is not a valid location" }


end
