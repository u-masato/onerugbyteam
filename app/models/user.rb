class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maxinum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validate :sex, presence: true,
      numericality: { only_integer: true, greater_than: 0, lesser_than: 2, allow_blank: true }
      
  validata :birthday, presence: true
    
  has_secure_password  
end
