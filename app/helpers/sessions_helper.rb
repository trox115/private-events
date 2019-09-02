module SessionsHelper
  def log_in(user)
    session[:name] = user.name
  end
  def current_user
    if (name = session[:name])
      @current_user ||= User.find_by(name: name)
    end
  end

  def logged_in?
    !current_user.nil?
  end

end