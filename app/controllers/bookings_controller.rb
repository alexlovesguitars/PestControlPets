class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit] 
  before_action :authenticate_user! 

  def index
    @bookings = current_user.bookings
  end


  def show
  end

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])  # To link the pet when creating a booking
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
  
  def set_booking
    @booking = Booking.find(params[:id])
  end
end
