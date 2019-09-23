# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    return unless session[:name]

    @current_user ||= User.find_by(name: session[:name])
  end

  def log_in(user)
    session[:name] = user.name
  end

  def logged_in
    return if current_user

    redirect_to login_path
  end

  def user_creator?
    @event = Event.find(params[:id])
    return if current_user == @event.creator

    redirect_to events_url
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
