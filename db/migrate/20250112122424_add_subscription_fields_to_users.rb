class AddSubscriptionFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :subscription_type, :string, null: false, default: "free"
    add_column :users, :is_subscribed, :boolean, default: false
  end
end
