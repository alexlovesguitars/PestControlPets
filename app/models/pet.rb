class Pet < ApplicationRecord
  has_many :bookings
  # belongs_to :user
  has_many :users, through: :bookings
end
