class UsersController < ApplicationController

  def index
    @users = User.all.sort_by{|u| u.name}
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.admin = false
  end

  def create
    if @user = User.find_by(email: user_params[:email])
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

  def update
    @user = User.find(params[:id])
    @user.update(admin: user_params[:admin])
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

end
