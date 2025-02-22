require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  has_many :workouts, dependent: :destroy

  normalizes :email, with: -> email { email.strip.downcase }

  # validates_with EmailValidator
  # validates_with PasswordValidator
  validates :password_confirmation, presence: true, on: :create

  validates :name, 
            presence: true,
            format: { with: /\A[A-Za-z]+\z/, message: "can only include letters" },
            length: { within: 2..50,
                      too_short: "must be at least 2 characters",
                      too_long: "must be at most 50 characters" }

  validates :gender, inclusion: { in: %w[male female non-binary] }, allow_nil: true

  validates :height, 
            numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 300 }, 
            allow_nil: true
            
  validates :weight, 
            numericality: { greater_than: 0, less_than_or_equal_to: 500 }, 
            format: { with: /\A\d+(\.\d{1})?\z/, message: "can have at most one decimal place" }, 
            allow_nil: true
end
