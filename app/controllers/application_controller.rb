class ApplicationController < ActionController::Base
  
  def current_user
    if (name = session[:name])
      @current_user ||= User.find_by(name: name)
    end
  end

  def log_in(user)
    session[:name] = user.name
  end

  def logged_in
    return if current_user
    redirect_to login_path
  end

  def not_logged_in
    return unless current_user
    redirect_to root_url
  end

  def log_out
    session.delete(:name)
    @current_user = nil
  end

end
