class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :show, :update, :destroy, :unavailable_dates]
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @booking = Booking.new(pet_id: params[:pet_id])
    @pet = Pet.find(params[:pet_id])
    @unavailable_dates = Booking.get_unavailable_dates(@pet)
    puts "@unavailable_dates: #{@unavailable_dates.inspect}"
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pet = Pet.find(params[:pet_id])
    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking was successfully created. The total price is #{@booking.total_price}€."
    else
      @pet = @booking.pet
      @unavailable_dates = Booking.get_unavailable_dates(@pet)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = @booking.pet
    @unavailable_dates = Booking.get_unavailable_dates(@pet, @booking.id)
  end

  def unavailable_dates
    @pet = @booking.pet
    unavailable_dates = []

    @pet.bookings.each do |booking|
      if booking != @booking && booking.start_date && booking.end_date
        unavailable_dates << { from: booking.start_date.strftime("%Y-%m-%d"), to: booking.end_date.strftime("%Y-%m-%d") }
      end
    end

    render json: unavailable_dates
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
    else
      @pet = @booking.pet
      @unavailable_dates = Booking.get_unavailable_dates(@pet, @booking.id)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other, notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end


  # def get_unavailable_dates(pet)
  #   bookings = Booking.new.where(pet: pet)
  #   unavailable_dates = []

  #   bookings.each do |booking|
  #     (booking.start_date..booking.end_date).each do
  #       unavailable_dates << date.strftime("%Y-%m-%d")
  #     end
  #   end

  #   return unavailable_dates.uniq
  # end
end
