class Team < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 1000 }
  
  has_many :members
  has_many :players, through: :members, source: :player
  
  def add_member(player, position_number)
    self.members.find_or_create_by(player_id: player.id, position_number: position_number)
  end
  
  def remove_member(player)
    member = self.members.find_by(player_id: player.id)
    member.destroy if member
  end
  
  def member(player)
    self.members.include?(player)
  end

end
