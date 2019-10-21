class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.date :birthday
      t.string :country_code
      t.string :image

      t.timestamps
    end
  end
end
