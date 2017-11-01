class UsersController < ApplicationController

  def index
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/login"
    else
      render "signup"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login
  end

  def profile
    user = User.find_by(username: params[:user][:username])
    if user.password == params[:user][:password]
      session[:user_id] = user.id
      redirect_to "/"
    else
      render "login"
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
