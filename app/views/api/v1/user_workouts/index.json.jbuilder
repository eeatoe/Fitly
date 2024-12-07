json.user_workouts @user_workouts do |user_workout|
  json.id user_workout.id
  json.title user_workout.title
  json.workout_category user_workout.workout_category

  json.duration "#{user_workout.duration} минут"
  json.calories_burned "-#{user_workout.calories_burned} калл"
  json.difficulty_level user_workout.difficulty_level
  json.location user_workout.location
end