require 'securerandom'

class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.base64
        u.admin = false
      end
      session[:user_id] = @user.id
      redirect_to root_path
    else
      if user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path
        else
          flash[:notice] = "Incorrect password. Please try again."
          redirect_to login_path
        end
      else
        flash[:notice] = "No user exists with this email address."
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
