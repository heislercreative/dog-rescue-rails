class ApplicationController < ActionController::Base

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_authentication_required
    if !logged_in?
      redirect_to login_path
    elsif !admin_logged_in?
      redirect_to user_path(current_user)
    end
  end

  def admin_logged_in?
    logged_in? && current_user.is_admin?
  end

  def event_organizer
    current_user.name == @event.organizer
  end

  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin_logged_in?
  helper_method :event_organizer

end
