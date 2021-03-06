# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :not_logged_in, only: %i[new create]
  before_action :logged_in, only: %i[show]

  def show
    @user = User.find(params[:id])
    @events = @user.events
     @user_attendance = @user.events_as_attendee
    # @events_created_future = @user.events.future.order(date: :desc)
    # @events_created_past = @user.events.past.order(date: :desc)
     @future_events = @user_attendance.future.order(date: :asc)
     @past_events = @user_attendance.past.order(date: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Events App, #{@user.name}!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
