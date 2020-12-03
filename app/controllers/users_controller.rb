class UsersController < ApplicationController
  def register

  end

  def create

  end

  def login

  end

  def edit

  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :comfirmation)
  end

end
