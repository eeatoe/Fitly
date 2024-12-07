# фабрика для workout_exercise. Для добавления ассоциаций
FactoryBot.define do
  factory :workout_exercise do
    association :workout, factory: :user_workout
    association :exercise

    sets { 5 }
    reps { 12 }
  end
end