class BookingsController < ApplicationController
  before_action :authenticate_user!  # Ensure user is logged in

  # Display all bookings for the current user
  def index
    @bookings = current_user.bookings
  end

  # Show details of a specific booking
  def show
    @booking = Booking.find(params[:id])
  end

  # Create a new booking
  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])  # To link the pet when creating a booking
  end

  # Create a booking
  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # Destroy a booking
  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully deleted.'
  end

  private

  # Strong parameters to allow only the relevant fields
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
end
