class Member < ApplicationRecord
  belongs_to :team
  belongs_to :player
  
  validates :position_number, presence: true, numericality: { only_integer: true, greater_than: 1, lesser_than: 16}

end
