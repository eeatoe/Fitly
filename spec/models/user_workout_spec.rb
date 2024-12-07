require 'rails_helper'

# bundle exec rspec spec/models/user_workout_spec.rb
RSpec.describe UserWorkout, type: :model do
  before do
    @user = create(:user)  # Создаем пользователя
    @user_workout = create(:user_workout, user: @user)  # Создаем user_workout, связанный с пользователем
  end

  # Тест валидаций
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user_workout).to be_valid
    end

    it 'is invalid without a title' do
      user_workout.title = nil
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      user_workout.description = nil
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a workout_category' do
      user_workout.workout_category = nil
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:workout_category]).to include("can't be blank")
    end

    it 'is invalid with a duration less than 5' do
      user_workout.duration = 4
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:duration]).to include("must be greater than 5")
    end

    it 'is valid with calories_burned greater than 50' do
      user_workout.calories_burned = 51
      expect(user_workout).to be_valid
    end

    it 'is invalid with calories_burned less than 50' do
      user_workout.calories_burned = 49
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:calories_burned]).to include("must be greater than 50")
    end

    it 'is valid with a valid difficulty_level' do
      user_workout.difficulty_level = "easy"
      expect(user_workout).to be_valid
    end

    it 'is invalid with an invalid difficulty_level' do
      user_workout.difficulty_level = "unknown"
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:difficulty_level]).to include("is not included in the list")
    end

    it 'is valid with a valid location' do
      user_workout.location = "Gym"
      expect(user_workout).to be_valid
    end

    it 'is invalid with an invalid location' do
      user_workout.location = "Unknown place"
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:location]).to include("is not included in the list")
    end
  end

  # Тест ассоциаций (отношений)
  describe 'associations' do
    it 'belongs to a user' do
      expect(user_workout.user).to eq(user)
    end

    it 'is invalid without a user' do
      user_workout.user = nil
      expect(user_workout).not_to be_valid
      expect(user_workout.errors[:user]).to include("must exist")
    end

    it 'has many workout_exercises' do
      exercise1 = create(:exercise)
      exercise2 = create(:exercise)
      create(:workout_exercise, workout: user_workout, exercise: exercise1)
      create(:workout_exercise, workout: user_workout, exercise: exercise2)

      expect(user_workout.workout_exercises.size).to eq(2)
      expect(user_workout.workout_exercises.map(&:exercise)).to contain_exactly(exercise1, exercise2)
    end

    it 'has many exercises through workout_exercises' do
      exercise1 = create(:exercise)
      exercise2 = create(:exercise)
      create(:workout_exercise, workout: user_workout, exercise: exercise1)
      create(:workout_exercise, workout: user_workout, exercise: exercise2)

      expect(user_workout.exercises.size).to eq(2)
      expect(user_workout.exercises).to include(exercise1, exercise2)
    end

    it 'deletes associated workout_exercises when user_workout is destroyed' do
      exercise = create(:exercise)
      workout_exercise = create(:workout_exercise, workout: user_workout, exercise: exercise)

      expect { user_workout.destroy }.to change { WorkoutExercise.count }.by(-1)
    end
  end
end