# frozen_string_literal: true

module SessionsHelper
  def current_user
    return unless session[:name]

    @current_user ||= User.find_by(name: session[:name])
  end

  def logged_in?
    !current_user.nil?
  end
end
