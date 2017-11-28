class Vehicle < ApplicationRecord
  belongs_to :user
  validates :price, :description, :brand, presence: :true, allow_blank: :false
end
