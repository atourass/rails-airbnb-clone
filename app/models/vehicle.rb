class Vehicle < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :price, :description, :brand, :model, presence: :true
  has_attachment :photo
end
