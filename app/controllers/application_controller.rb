class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

  def require_owner(resource)
    unless resource.user_id == current_user.id
      flash[:danger] = "You are not authorized to perform that action."
      redirect_to root_path
    end
  end
end
