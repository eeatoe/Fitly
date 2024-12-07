json.user_workout do
  json.id @user_workout.id
  json.title @user_workout.title
  json.description @user_workout.description
  json.workout_category @user_workout.workout_category
  json.duration "#{@user_workout.duration} минут"
  json.calories_burned "-#{@user_workout.calories_burned} калл"
  json.difficulty_level @user_workout.difficulty_level
  json.location @user_workout.location
  json.created_at @user_workout.created_at

  json.exercises @user_workout.exercises do |exercise|
    json.id exercise.id
    json.name exercise.name

    workout_exercise = @user_workout.workout_exercises.find_by(exercise_id: exercise.id)
    json.sets workout_exercise&.sets
    json.reps workout_exercise&.reps
    json.weight workout_exercise&.weight
  end
end