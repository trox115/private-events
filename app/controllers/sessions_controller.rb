class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def new
  end
  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in(@user)
      flash[:success] = 'Log in successful.'
      redirect_to @user

    else
      flash.now[:danger] = 'The user id you entered does not exist.'
      render 'new'
    end
  end
  def destroy
  end
end
