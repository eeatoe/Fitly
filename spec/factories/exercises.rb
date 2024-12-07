FactoryBot.define do
  factory :exercise do
    sequence(:name) { |n| "Exercise #{n}" }
    description { "This is a description for the exercise." }
    sequence(:link) { |n| "https://example.com/exercise/#{n}" }

    # Создаем одну или несколько мышечных групп после создания упражнения
    after(:create) do |exercise|
      exercise.muscle_groups << create(:muscle_group) unless exercise.muscle_groups.any?
    end
  end
end