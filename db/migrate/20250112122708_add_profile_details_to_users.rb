class AddProfileDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_picture_link, :string
    add_column :users, :gender, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :float
    add_column :users, :fitness_goals, :string
    add_column :users, :experience_level, :string
  end
end
