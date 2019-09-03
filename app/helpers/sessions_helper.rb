module SessionsHelper
  
  def current_user
    if (name = session[:name])
      @current_user ||= User.find_by(name: name)
    end
  end

  def logged_in?
    !current_user.nil?
  end

end
