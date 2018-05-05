class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path
      else
        flash[:notice] = "Incorrect password. Please try again."
        redirect_to login_path
      end
    else
      flash[:notice] = "No user exists with this email address."
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
