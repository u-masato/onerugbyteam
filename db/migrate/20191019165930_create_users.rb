class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password_digest
      t.integer :sex, null: false, default: 1
      t.date :birthday
      t.boolean :administrator, null: false, default: false

      t.timestamps
    end
  end
end
