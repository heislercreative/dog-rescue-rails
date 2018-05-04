class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.admin = false
  end

  def create
    raise params.inspect
    if User.find(email: user_params[:email])
      flash[:notice] = "Account already exists with this email. Please select a different email or sign in."
      render :new
    else
      @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
