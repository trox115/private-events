class EventsController < ApplicationController
  before_action :logged_in, only: %i[show index create new]
  before_action :user_creator?, only: %i[edit update]
  def index
    @events = Event.all
    @past_events = @events.past
    @upcoming_events = @events.future
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.guests
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    guests = params["event"]["guests"]
    if @event.save
      guests.each do |guest| 
        user = User.find_by(id: guest)
        user ? @event.guests << user : next
      end
      flash[:success] = "New Event Created, #{@event.title}!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    guests = params["event"]["guests"]
    if @event.update(event_params)
      # Handle a successful update.
      
      guests.each do |guest| 
        user = User.find_by(id: guest)
        user ? @event.guests << user : next
      end
      flash[:success] = 'event updated'
      redirect_to @event
    else
      render 'edit'
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :guests=>[:id])
  end

end
