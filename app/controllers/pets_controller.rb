class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :unavailable_dates]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @booking = Booking.new
    @unavailable_dates = unavailable_dates
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @pet.user == current_user # only deletable if its your own pet
      @pet.destroy
      redirect_to root_path, notice: "Pet deleted successfully."
    else
      redirect_to pet_path(@pet), alert: "You are not authorized to delete this pet."
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: "Pet updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def my_pets
    @pets = current_user.pets
  end

  def unavailable_dates
    dates = []
    @pet.bookings.each do |booking|
      if booking.start_date && booking.end_date
        dates << { from: booking.start_date.strftime("%Y-%m-%d"), to: booking.end_date.strftime("%Y-%m-%d") }
      end
    end
    dates
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :race, :price_per_day, :description, :targets, :user_id, :photo)
  end
end
