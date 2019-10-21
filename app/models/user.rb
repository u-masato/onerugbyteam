class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :sex, presence: true,
      numericality: { only_integer: true, greater_than: 0, lesser_than: 2, allow_blank: true }
      
  validates :birthday, presence: true
    
  has_secure_password
  
  has_many :favorites
  has_many :favorite_players, through: :favorites, source: :player

  def add_favorite(player)
    self.favorites.find_or_create_by(player_id: player.id)
  end

  def remove_favorite(player)
    favorite = self.favorites.find_by(player_id: player.id)
    favorite.destroy if favorite
  end
  
  def is_fovarite_player?(player)
    self.favorite_players.include?(player)
  end


end
