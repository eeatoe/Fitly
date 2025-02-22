class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 254, index: { unique: true }
      t.string :phone, limit: 18
      t.string :password_digest, null: false, limit: 64
      t.string :name, null: false, limit: 20
      t.date :birth_date, null: false
      t.boolean :is_expert, null: false, default: false

      t.timestamps
    end
  end
end