class Vehicle < ApplicationRecord
  belongs_to :user
  validates :price, :description, :brand, :model, presence: :true, allow_blank: :false
end
