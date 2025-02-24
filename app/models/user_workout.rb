class UserWorkout < ApplicationRecord
  # Связи (associations)
  belongs_to :user
  belongs_to :workout

  # Валидации (validations)
  validates :user_id, presence: true
  validates :workout_id, presence: true
  validates :is_favorite, inclusion: { in: [true, false] }

  # Скопы (scopes)
  scope :favorites, -> { where(is_favorite: true) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def favorite?
    is_favorite == true
  end
end
