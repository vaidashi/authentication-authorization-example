class SessionsController < ApplicationController

  def new

  end

  def create
    #have username and password
    #find user from db with username from the params
    @user = User.find_by(username: params[:session][:username])
    #check user's password against the hash in the db
    #if password is correct
    if @user.authenticate(params[:session][:password])
      #set a session
      session[:user_id] = @user.id
      #success flash msg
      flash[:notice] = "Successful login"
      #redirect the user
      redirect_to @user
    #if incorrect
    else

    end
  end

  def destroy
    session[:user_id] = nil
    #session.clear
    flash[:notice] = "Goodbye"
    redirect_to root_path
  end

end
