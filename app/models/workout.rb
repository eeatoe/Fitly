class Workout < ApplicationRecord
  # Перечисления (enums)
  enum difficulty_level: { easy: 0, medium: 1, hard: 2 }
  enum location: { gym: 0, home: 1, outdoor: 2, office: 3, outdoor_gym_area: 4 }

  # Константы (constants)
  include Constants

  # Связи (associations)
  has_many :user_workouts
  has_many :users, through: :user_workouts
  has_and_belongs_to_many :fitness_goals

  # Валидации (validations)
  validates :name, presence: true,
    length: {minimum: 6, maximum: 50},
    format: {with: NAME_FORMAT},
    uniqueness: { case_sensitive: false }

  validates :description, presence: true, if: :expert?, # Если эксперт, описание обязательно
    length: {maximum: 300},
    format: {with: DESCRIPTION_FORMAT}

  validates :duration, presence: true,
    numericality: {only_integer: true, greater_than: 0}

  validates :difficulty_level, presence: true

  validates :location, presence: true,
  validate :locations_are_valid

  # Коллбеки (callbacks)
  before_save :normalize_description

  private

  def expert?
    user&.role == 1
  end

  def normalize_description
    self.description = description.strip.capitalize
  end

  def locations_are_valid
    invalid_locations = locations - VALID_LOCATIONS
    if invalid_locations.any?
      errors.add(:locations, I18n.t('workout.errors.invalid_locations', locations: invalid_locations.join(', ')))
    end
  end
end
