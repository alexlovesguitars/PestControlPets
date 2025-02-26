class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def new
  end

  def create
  end
end
