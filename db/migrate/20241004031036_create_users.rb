class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, limit: 64, null: false

      t.string :name, limit: 20, null: false
      t.date :birth_date, null: false

      t.string :gender, null: true
      t.integer :height, null: true
      t.float :weight, null: true

      t.string :subscription_type, null: false, inclusion: { in: %w[free paid] }, default: 'free'
      t.boolean :is_expert, null: false, default: false

      t.timestamps
    end
  end
end