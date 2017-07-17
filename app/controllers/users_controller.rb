class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to @user
    else
    end
  end

  def show

  end

private

  def user_attributes
    params.require(:user).permit(:username, :password)
  end

end
