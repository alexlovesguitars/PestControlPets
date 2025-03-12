class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  validate :date_range_available

  def self.get_unavailable_dates(pet, current_booking_id = nil)
    bookings = Booking.where(pet: pet)
    unavailable_dates = []

    bookings.each do |booking|
      if booking.start_date && booking.end_date
        if booking.id != current_booking_id
          unavailable_dates << {
            from: booking.start_date.strftime("%Y-%m-%d"),
            to: booking.end_date.strftime("%Y-%m-%d")
          }
        end
      end
    end

    return unavailable_dates
  end

  def total_price
    days_booked = (end_date - start_date).to_i + 1
    days_booked * pet.price_per_day
  end

  def period
    (start_date..end_date)
  end


  private

  def start_date_before_end_date
    if start_date && end_date && start_date >= end_date
      errors.add(:start_date, "must be before the end date")
    end
  end

  def date_range_available
    return unless start_date && end_date && pet
    unavailable_dates = Booking.get_unavailable_dates(pet, id)

    (start_date..end_date).each do |date|
      if unavailable_dates.include?(date.strftime("%Y-%m-%d")) &&
        !(id && date.strftime("%Y-%m-%d") >= created_at.to_date.strftime("%Y-%m-%d") && date.strftime("%Y-%m-%d") <= updated_at.to_date.strftime("%Y-%m-%d"))

        errors.add(:base, "The selected date range contains unavailable dates.")
        break
      end
    end
  end
end
