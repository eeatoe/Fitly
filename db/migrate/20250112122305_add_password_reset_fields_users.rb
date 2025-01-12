class AddPasswordResetFieldsUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :reset_password_token, :string, index: { unique: true }
    add_column :users, :reset_password_sent_at, :datetime
  end
end
