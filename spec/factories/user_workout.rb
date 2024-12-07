FactoryBot.define do
  factory :user_workout do
    title { "Sample Workout" }
    description { "This is a sample workout description." }
    workout_category { "Yoga" }
    duration { 30 }
    calories_burned { 100 }
    difficulty_level { "medium" }
    location { "Home" }
    
    association :user # Устанавливаем ассоциацию с моделью User
  end
end