class Pet < ApplicationRecord
  has_many :bookings
  belongs_to :user # owner
  has_many :users, through: :bookings # user
  has_one_attached :photo
end
