module EventsHelper
  def eventcreator(event)
    User.find_by(id: event.creator).name
  end
end
