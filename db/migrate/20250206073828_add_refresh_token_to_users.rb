class AddRefreshTokenToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :refresh_token, :string
    add_column :users, :refresh_token_expires_at, :datetime

    add_index :users, :refresh_token, unique: true
  end
end
