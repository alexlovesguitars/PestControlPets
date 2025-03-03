class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit]

  def edit
  end

  def update
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
