class UsersController < ApplicationController
  before_action :current_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  # def current_user
  #   @user ||= User.find(session[:user_id]) if session[:user_id]
  # end

end
