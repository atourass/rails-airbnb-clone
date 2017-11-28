class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :date_from, :date_to, :distance, presence: true
  validate :dates_validations
  validates :distance,  numericality: true

  def dates_validations
    errors.add(:date_from, "can't be in the past") if date_from < Date.today
    errors.add(:date_to, "can't be earlier than date of pick up") if date_from > date_to
  end
end
