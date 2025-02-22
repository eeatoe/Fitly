class UserWorkout < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :user_id, presence: true
  validates :workout_id, presence: true
  validates :is_favorite, presence: true
end