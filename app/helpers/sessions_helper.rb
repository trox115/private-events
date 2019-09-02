# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:name] = user.name
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
