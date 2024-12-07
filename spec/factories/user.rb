FactoryBot.define do
  factory :user do
    name { "Alice" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "_Password123!" }
    password_confirmation { "_Password123!" }
    gender { "female" }
    height { 170 }
    weight { 60 }
    birth_date { Date.today }

    trait :male do
      name { "Bob" }
      gender { "male" }
    end

    trait :non_binary do
      name { "Charlie" }
      gender { "non-binary" }
    end

    # Можно еще добавить некоторые атрибуты
  end
end