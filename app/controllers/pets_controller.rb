class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :home]

  def home
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
  end

  def create
  end
end
