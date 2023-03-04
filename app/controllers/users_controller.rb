class UsersController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end  
end
