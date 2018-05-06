class UsersController < ApplicationController

  def index
    @users = User.where.not(id: 1).sort_by{|u| u.name}
  end

  def show
    @user = User.find(current_user.id)
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
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(admin: user_params[:admin])
    flash[:notice] = "Updated user admin status."
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    if !@user.dogs.nil?
      @user.dogs.each{|d| d.destroy}
    end
    @user.destroy
    flash[:notice] = "User successfully deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

end
