class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_info = user_params
    user_info[:username] = user_info[:username].downcase
    @user = User.new(user_info)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end
end