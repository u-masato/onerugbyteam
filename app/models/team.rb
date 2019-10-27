class Team < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 1000 }
  
  has_many :members
  has_many :players, through: :members, source: :player
  
  def add_member(player_id, position_number)
    self.members.find_or_create_by(player_id: player_id, position_number: position_number)
  end
  
  def remove_member(member)
    member.destroy if member
  end
  
  def update_member(player, position_number)
    member = self.members.find_by(player_id: player.id)
    member.update(position_number: position_number)
  end
  
  def players?(player)
    self.players.include?(player)
  end
  
  def player_by_position_number_of(position_number)
    member = self.members.find_by(position_number: position_number)
    if member.present?
      Player.find(member.player_id)
    else
      nil
    end
  end

end
