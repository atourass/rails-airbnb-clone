class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :vehicle, :user, :date_from, :date_to, :message, presence: true
  validate :dates_validations

  def dates_validations
    if !date_from.nil? && !date_to.nil?
      errors.add(:date_from, "can't be in the past") if date_from < Date.today
      errors.add(:date_to, "can't be earlier than date of pick up") if date_from > date_to
    end
  end
end
