module Constants
  PASSWORD_FORMAT = /\A
    (?=.*\d)      # Должен содержать цифры
    (?=.*[a-z])   # Должен содержать строчные буквы
    (?=.*[A-Z])   # Должен содержать заглавные буквы
  \z/x

  LETTERS_ONLY_FORMAT = /\A[a-zA-Zа-яА-ЯёЁ]+\z/
  
  ALPHANUMERIC_NAME_FORMAT = /\A[a-zA-Zа-яА-ЯёЁ][a-zA-Zа-яА-ЯёЁ\d\s'’\-:;%][a-zA-Zа-яА-ЯёЁ\d]\z/

  WORKOUT_CATEGORY = [
    "Strength training", "Cardio training", "Functional training",
    "Strength aerobics", "Plyometrics", "Endurance training",
    "Flexibility and stretching", "High-Intensity Interval Training",
    "CrossFit", "Yoga", "Pilates", "Bodyweight training", "Aerobics"
  ]

  DIFFICULTY_LEVEL = ["Easy", "Medium", "Hard"]
  LOCATIONS = ["Gym", "Home", "Outdoor", "Office", "Outdoor Gym Area"]
end
