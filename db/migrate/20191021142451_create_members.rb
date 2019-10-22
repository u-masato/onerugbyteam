class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :position_number
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
      
      t.index [:team_id, :position_number], unique: true
      t.index [:team_id, :player_id], unique: true
    end
  end
end
