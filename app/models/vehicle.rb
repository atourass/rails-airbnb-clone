class Vehicle < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :price, :description, :brand, :model, presence: :true, allow_blank: :false
end
