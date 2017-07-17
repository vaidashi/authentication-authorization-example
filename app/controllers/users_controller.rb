class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
  end

private

  def user_attributes
    params.require(:user).permit(:username, :password)
  end

end
