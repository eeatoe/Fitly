require 'rails_helper'

# bundle exec rspec spec/models/user_spec.rb
RSpec.describe User, type: :model do
  before do
    @users = [
      create(:user, name: "Alice", gender: "female", height: 165, weight: 55),
      create(:user, name: "Bob", gender: "male", height: 180, weight: 75),
      create(:user, name: "Charlie", gender: "non-binary", height: 170, weight: 65),
      create(:user, name: "Diana", gender: "female", height: 160, weight: 50),
      create(:user, name: "Ethan", gender: "male", height: 175, weight: 70)
    ]
  end

  it 'creates valid users' do
    @users.each do |user|
      expect(user).to be_valid
    end
  end

  it 'is invalid without a password confirmation' do
    user = build(:user, password_confirmation: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid with a name that is too short' do
    user = build(:user, name: "A")
    expect(user).not_to be_valid
  end

  it 'is invalid with a name that contains numbers' do
    user = build(:user, name: "Alice123")
    expect(user).not_to be_valid
  end

  it 'is invalid with height greater than 300' do
    user = build(:user, height: 301)
    expect(user).not_to be_valid
  end

  it 'is invalid with weight greater than 500' do
    user = build(:user, weight: 501)
    expect(user).not_to be_valid
  end 
end