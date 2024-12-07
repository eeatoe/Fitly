json.exercise do
  json.id @exercise.id
  json.name @exercise.name
  json.description @exercise.description
  json.link @exercise.link
  json.muscle_groups @exercise.muscle_groups do |muscle_group|
    json.id muscle_group.id
    json.name muscle_group.name
  end
end