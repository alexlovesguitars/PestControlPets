class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out(@user)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :image, :address)
  end
end
