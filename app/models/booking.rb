class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  validate :other_booking_overlap

  def self.get_unavailable_dates(pet)
    bookings = Booking.where(pet: pet).where.not(id: nil)
    unavailable_dates = []

    bookings.each do |booking|
      if booking.start_date && booking.end_date
        (booking.start_date..booking.end_date).each do |date|
          unavailable_dates << date.strftime("%Y-%m-%d")
        end
      end
    end

    return unavailable_dates.uniq
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

  # def date_range_available
  #   return unless start_date && end_date && pet

  #   unavailable_dates = Booking.get_unavailable_dates(pet)

  #   (start_date..end_date).each do |date|
  #     if unavailable_dates.include?(date.strftime("%Y-%m-%d"))
  #       errors.add(:start_date, "The selected date range contains unavailable dates.")
  #       break
  #     end
  #   end
  # end



  def other_booking_overlap
    if errors.blank?
      other_bookings = pet.bookings
      overlapping_bookings = other_bookings.select do |other_booking|
        period.overlaps?(other_booking.period)
      end
      is_overlapping = !overlapping_bookings.empty?
      errors.add(:base, "Picked date is not available") if is_overlapping
    end
  end


end
