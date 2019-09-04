class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "New Event Created, #{@event.title}!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end

end
