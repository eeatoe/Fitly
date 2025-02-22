require "bcrypt"

class User < ApplicationRecord
  has_secure_password

  # Константы (constants)
  VALID_GENDERS = %w[male female non-binary].freeze
  VALID_EXPERIENCE_LEVELS = %w[beginner intermediate advanced].freeze
  VALID_FITNESS_GOALS = %w[fat_loss, muscle_gain, maintenance, endurance_training, strength_training, flexibility, functional_fitness].freeze

  # Связи (associations)
  has_many :user_workouts
  has_many :workouts, through: :user_workouts
  has_and_belongs_to_many :fitness_goals

  # Валидации (validations)
  validates :email, presence: true, 
    uniqueness: true, 
    length: { maximum: 254 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }


  validates :password, presence: true, 
    length: { minimum: 6, maximum: 64 },
    format: { with: Constants::PASSWORD_FORMAT }, if: -> { password.present? }

  validates :name, presence: true,
    format: { with: Constants::LETTERS_ONLY_FORMAT },
    length: { within: 2..50 }

  validates :gender, allow_nil: true,
    inclusion: { in: %w[male female non-binary] }

  validates :height, allow_nil: true,
    numericality: { greater_than: 0, less_than_or_equal_to: 250 }
    

  validates :weight, allow_nil: true,
    numericality: { greater_than: 0, less_than_or_equal_to: 400 },
    format: { with: /\A\d+(\.\d{1})?\z/ }

  # Скоупы (scopes)
  # ...

  # Коллбэки (callbacks)
  before_save :normalize_email
  before_save :normalize_name

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end

  def normalize_name
    self.name = name.titleize if name.present?
  end
end
