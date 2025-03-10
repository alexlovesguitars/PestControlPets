class Pet < ApplicationRecord
  has_many :bookings
  belongs_to :user # owner
  has_many :users, through: :bookings # user
  has_one_attached :photo
  validates :name, presence: true
  validates :race, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  # validates :photo, presence: true
end
