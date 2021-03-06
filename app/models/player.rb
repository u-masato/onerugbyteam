class Player < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :position, presence: true, inclusion: { in: %w(PR HO LO FL NO8 SH SO CTB WTB FB UTB)}
  validates :height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true }
  validates :birthday, presence: true
  # validates :country, presence: true
  # validates :image, format { with: \.[jpeg png] }
  
  has_many :favorites
  has_many :followers, through: :favorites, source: :user
end
