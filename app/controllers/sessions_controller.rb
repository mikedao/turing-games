class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username].downcase) || User.new
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to root_path
    else 
      flash[:error] = "Invalid credentials"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end