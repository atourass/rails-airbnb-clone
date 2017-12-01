class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :vehicle, :user, :date_from, :date_to, :message, presence: true
  validate :dates_validations
  after_validation :calc_price

  def dates_validations
    errors.add(:date_from, "can't be in the past") if date_from < Date.today
    errors.add(:date_to, "can't be earlier than date of pick up") if date_from > date_to
  end

  def calc_price
    duration = (self.date_to - self.date_from).to_i
    duration += 1
    if duration == 0
      self.price = self.vehicle.price
    else
      self.price = self.vehicle.price * duration
    end
  end

end
