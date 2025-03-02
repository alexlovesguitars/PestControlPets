class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :home]

  def home
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.user == current_user
      if @pet.update(pet_params)
        redirect_to pet_path(@pet)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to pets_path
    end
  end


  private

  def pet_params
    params.require(:pet).permit(:name, :race, :price_per_day, :description, :targets, :user_id, :photo)
  end
end
