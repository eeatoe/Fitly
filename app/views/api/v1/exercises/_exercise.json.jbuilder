json.id exercise.id
json.name exercise.name

json.workout_exercises exercise.workout_exercises do |workout_exercise|
  json.sets workout_exercise.sets
  json.reps workout_exercise.reps
  json.weight workout_exercise.weight
  json.workout_id workout_exercise.workout_id
end