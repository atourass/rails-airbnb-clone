class Vehicle < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :price, :description, :brand, :model, presence: :true, allow_blank: :false
  has_attachment :photo
end
