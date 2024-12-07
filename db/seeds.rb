# muscle_groups = [
#   "Muscles of the Head",
#   "Masticatory Muscles",
#   "Facial Muscles",
#   "Muscles of the Neck",
#   "Muscles of the Torso",
#   "Muscles of the Chest",
#   "Muscles of the Abdomen",
#   "Muscles of the Back",
#   "Muscles of the Upper Limbs",
#   "Muscles of the Shoulder Girdle",
#   "Muscles of the Arm",
#   "Muscles of the Forearm",
#   "Muscles of the Hand",
#   "Muscles of the Lower Limbs",
#   "Muscles of the Pelvic Girdle",
#   "Muscles of the Thigh",
#   "Muscles of the Leg",
#   "Muscles of the Foot"
# ]

# Заполняем таблицу с группами мышц
# muscle_groups.each do |group|
#   MuscleGroup.find_or_create_by(name: group)
# end

# Очистка таблиц и сброс счетчиков
UserWorkout.destroy_all
Exercise.destroy_all
MuscleGroup.delete_all
WorkoutExercise.destroy_all
User.destroy_all

# Сброс счетчиков идентификаторов в бд
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE user_workouts RESTART IDENTITY CASCADE")


# Заполняем таблицу с user-ами
10.times do
  FactoryBot.create(:user)
end

# Заполняем таблицу UserWorkout
User.find_each do |user|
  5.times do # Создаем 5 тренировок для каждого пользователя
    FactoryBot.create(:user_workout, user: user) # создание user_workouts с установленной ассоциацией user
  end
end

# Создание упражнений
10.times do
  FactoryBot.create(:exercise)
end

# Связывание UserWorkouts и Exercises
UserWorkout.find_each do |workout|
  exercises = Exercise.order("RANDOM()").limit(3) # Выбираем 3 случайных упражнения

  exercises.each do |exercise|
    FactoryBot.create(:workout_exercise, workout: workout, exercise: exercise)
  end
end