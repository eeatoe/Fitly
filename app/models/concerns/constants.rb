module Constants
  # Регулярные выражения (regular expressions)
  PASSWORD_FORMAT = /\A
    (?=.*\d)      # Должен содержать цифры
    (?=.*[a-z])   # Должен содержать строчные буквы
    (?=.*[A-Z])   # Должен содержать заглавные буквы
  \z/x

  DESCRIPTION_FORMAT = /\A[a-zA-Zа-яА-ЯёЁ0-9\s.,:;!?()&%]*\z/

  NAME_FORMAT = /\A[a-zA-Zа-яА-ЯёЁ]+\z/
  
  # Константы (constants)
  VALID_WORKOUT_CATEGORY = [
    "Strength training", "Cardio training", "Functional training",
    "Strength aerobics", "Plyometrics", "Endurance training",
    "Flexibility and stretching", "High-Intensity Interval Training",
    "CrossFit", "Yoga", "Pilates", "Bodyweight training", "Aerobics"
  ]

  VALID_LOCATIONS = ["Gym", "Home", "Outdoor", "Office", "Outdoor Gym Area"]
end
